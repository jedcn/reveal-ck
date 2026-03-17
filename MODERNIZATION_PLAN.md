# Modernize reveal-ck for Ruby 3.3

## Context

reveal-ck targets Ruby 2.5–2.7 (last released Feb 2020). The dev container was updated to Ruby 3.3, which makes `bundle install` fail immediately because `listen = 3.2.1` (exact pin) declares `ruby < 3.A`. Several gem major versions also have breaking API changes requiring application code changes.

**Goal:** Modernize everything — Ruby version, all gems to latest, application code updated for new APIs, all tests passing — via a series of small PRs against a `modernize-ruby` base branch that eventually merges to master.

**End state:** `bundle install` works, `bundle exec rake ci` (spec + rubocop + cucumber) all green on Ruby 3.3.

GitHub issue tracking this work: https://github.com/jedcn/reveal-ck/issues/110

---

## 7 Ordered PRs Against `modernize-ruby`

### PR 1 — Upgrade RuboCop to 1.x and reset config

**Why first:** RuboCop 1.x refuses to load a 0.60-era `.rubocop.yml`. Zero runtime impact.

Files:
- `reveal-ck.gemspec` — `rubocop` dev dep: `'~> 0.60'` → `'~> 1.60'`
- `.rubocop.yml` — rewrite for 1.x:
  - Add `AllCops: NewCops: disable`
  - Add `AllCops: TargetRubyVersion: 3.3`
  - Remove `Gemspec/RequiredRubyVersion` block (renamed in 1.x)
  - Keep existing metric/style exclusions

**Verify:** `bundle exec rake rubocop` passes.

---

### PR 2 — Bump safe gem dependencies; unblock `bundle install`

**Why second:** Unpins versions blocking Ruby 3.3. Excludes gems with breaking API changes (html-pipeline, haml, rack) — those get their own PRs paired with code changes.

Files — `reveal-ck.gemspec`:
- `required_ruby_version`: `'>= 2.5'` → `'>= 3.1'`
- `listen`: `'3.2.1'` → `'~> 3.9'`
- `rack-livereload`: `'0.3.17'` → `'~> 0.6'`
- `tilt`: `'2.0.9'` → `'~> 2.4'`
- `guard`: `'~> 2.16'` → `'~> 2.19'`
- `docile`: `'~> 1.3'` → `'~> 1.4'`
- `gemoji`: `'~> 3.0'` → `'~> 4.1'`
- `slim`: `'~> 4.0'` → `'~> 5.0'`
- `kramdown`: `'~> 2.1'` → `'~> 2.5'`
- `.ruby-version` — `2.7.0` → `3.3.0`

**Verify:** `bundle install` succeeds.

---

### PR 3 — Fix Ruby 3.x language-level issues

**Why third:** Clean language baseline before harder API migrations — so failures in PRs 4/5/6 are unambiguous.

Files:
- `lib/reveal-ck/config.rb` — replace `Config < OpenStruct` with a hash-backed `@data` implementation using `method_missing`/`respond_to_missing?`. OpenStruct is deprecated in Ruby 3.2+ and may be removed in 3.4. Preserve public interface: `config.attr`, `config.attr=`, `config.to_h`, `config.merge!`, `config[key]`, `config[key]=`. Also fix `each_pair` → `each`.
- `lib/reveal-ck/builders/slides_builder.rb` — `YAML.load_file` → `YAML.safe_load_file(file, permitted_classes: [Symbol])` (raises `Psych::DisallowedClass` in Ruby 3.1+)
- `lib/reveal-ck/presentation_dsl.rb` (×2) and `lib/reveal-ck/render/contents_of.rb` — `File.open(path).read` → `File.read(path)`

**Verify:** `bundle exec rake spec` — all 37 spec files pass.

---

### PR 4 — Migrate html-pipeline from 2.x to 3.x

**Why fourth:** Most invasive change; core generation path. html-pipeline 3.x migrated from Nokogiri to Selma with a completely redesigned filter API. `MentionFilter` and `AutolinkFilter` were removed from the gem — those features are dropped (see behavior change note below).

Files:
- `reveal-ck.gemspec`: `html-pipeline` `'~> 2.12'` → `'~> 3.0'`
- `lib/html/pipeline/reveal_ck_emoji_filter.rb` — complete rewrite. In 3.x, filters are plain objects implementing `call(input_hash)` returning modified hash. Context (`asset_root`) passed at construction via `initialize(context = {})`. Use regex-based emoji replacement.
- `lib/reveal-ck/filtered_html_string.rb` — update call from `pipeline.call(html, config)` → `pipeline.call(html)`; remove `config` from constructor args.
- `lib/reveal-ck/builders/create_slides_html.rb` — update filter construction to pass initialized instances with context: `filters = filter_classes.map { |k| k.new(config.to_h) }`
- `lib/reveal-ck/config.rb` — remove `MentionFilter`/`AutolinkFilter` from default filter list; default becomes `['HTML::Pipeline::RevealCKEmojiFilter']` only

Tests:
- `spec/lib/html/pipeline/reveal_ck_emoji_filter_spec.rb` — rewrite for `call(input_hash)` interface
- `spec/lib/reveal-ck/config_spec.rb` — update default filters assertion
- `features/mention.feature` — **delete** (MentionFilter removed from gem)
- `features/auto-link.feature` — **delete** (AutolinkFilter removed from gem)

**Verify:** `bundle exec rake spec` passes. `bundle exec cucumber` passes. `features/emoji.feature` passes.

---

### PR 5 — Upgrade Haml from 5.x to 6.x

Files:
- `reveal-ck.gemspec`: `haml` `'~> 5.1'` → `'~> 6.0'`
- `lib/reveal-ck/tilt/config.rb` — ensure `require 'tilt/haml'` is present (haml 6 + tilt 2.4 need explicit load to avoid thread-safety warnings)
- Audit `.haml` templates in `files/reveal-ck/templates/` for `escape_html` breakage (haml 6 defaults `escape_html: true`); bundled templates use no raw HTML interpolation so this should be safe

**Verify:** `bundle exec cucumber features/generate-with-haml.feature` passes.

---

### PR 6 — Upgrade Rack from 2.x to 3.x; add rackup gem

**Why sixth:** Only affects the `serve` command; isolated. Rack 3.x extracted `Rack::Server` into the separate `rackup` gem.

Files:
- `reveal-ck.gemspec`: `rack` `'~> 2.2'` → `'~> 3.0'`; add `s.add_dependency 'rackup', '~> 2.1'`
- `lib/reveal-ck/commands/start_web_server.rb` — add `require 'rackup'`; `Rack::Server.new(...)` → `Rackup::Server.new(...)`
- `spec/lib/reveal-ck/commands/start_web_server_spec.rb` — add `require 'rackup'`; update mock from `Rack::Server` → `Rackup::Server`

**Verify:** `bundle exec rake spec` passes. `bundle exec cucumber features/serve.feature` passes.

---

### PR 7 — Update dev dependencies, CI config, and final cleanup

Files:
- `reveal-ck.gemspec` dev deps: bump `aruba` (~> 2.2), `cucumber` (~> 9.x), add `activesupport` version constraint (~> 7.1), remove `relish` (abandoned since 2014)
- `.travis.yml` — update Ruby test matrix to 3.1, 3.2, 3.3 (or replace with GitHub Actions)
- Update `s.date` in gemspec

**Verify:** Full `bundle exec rake ci` passes green on Ruby 3.3.

---

## Behavior Change

**mention and auto-link features dropped:** html-pipeline 3.x removed `MentionFilter` and `AutolinkFilter`. The corresponding Cucumber acceptance tests (`mention.feature`, `auto-link.feature`) are deleted in PR 4. Users who relied on these filters can implement custom filter classes.

---

## File → PR Mapping

| File | PR |
|---|---|
| `.rubocop.yml` | 1 |
| `reveal-ck.gemspec` | 1, 2, 4, 5, 6, 7 |
| `.ruby-version` | 2 |
| `lib/reveal-ck/config.rb` | 3, 4 |
| `lib/reveal-ck/builders/slides_builder.rb` | 3 |
| `lib/reveal-ck/presentation_dsl.rb` | 3 |
| `lib/reveal-ck/render/contents_of.rb` | 3 |
| `lib/html/pipeline/reveal_ck_emoji_filter.rb` | 4 |
| `lib/reveal-ck/filtered_html_string.rb` | 4 |
| `lib/reveal-ck/builders/create_slides_html.rb` | 4 |
| `lib/reveal-ck/tilt/config.rb` | 5 |
| `lib/reveal-ck/commands/start_web_server.rb` | 6 |
| `spec/lib/html/pipeline/reveal_ck_emoji_filter_spec.rb` | 4 |
| `spec/lib/reveal-ck/config_spec.rb` | 4 |
| `spec/lib/reveal-ck/commands/start_web_server_spec.rb` | 6 |
| `features/mention.feature` | 4 (delete) |
| `features/auto-link.feature` | 4 (delete) |
