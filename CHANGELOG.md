# Change Log

All notable changes to this project will be documented in this file.

Starting with version 3, the major version of this project matches
reveal.js's major version: 3.

Similar to http://semver.org, the minor of this project will bump when
features are added,

Similar to http://semver.org, the patch of this project will bump when
bugs are fixed.

## [Unreleased][unreleased]

[unreleased]: https://github.com/jedcn/reveal-ck/compare/v3.9.2...master

### Added

* Nothing

### Changed

* The embedded reveal.js has been updated to version 3.7.0 to 3.9.2.
  There's some great stuff [here](https://github.com/hakimel/reveal.js/releases)
  and I think my favorite could be the step-by-step highlighting.
* All dependencies have been refreshed to recently released versions.
* Restrictions on dependencies have been loosened
* The reporting of code coverage to CodeClimate has been updated
* reveal-ck is now supported on ruby 2.5, 2.6, and 2.7.
* Heads Up! If you write slides in HAML, we're now using HAML 5.0
* Heads Up! If you write slides in Markdown, we're now using Kramdown 2
* Heads Up! If you write slides in Slim, we're now using Slim 4
* Thanks to @blimmer for pointing out the need to upgrade Haml and Rack,
  and for submitting his own and reading PR!

### Fixed

* Nothing.

## 3.9.2 / 2019-02-19

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.9.1...v3.9.2)

### Added

* Nothing

### Changed

* Nothing

### Fixed

* Update asset_root to sync with new Github URLs for emoji. Thanks
  @justin-vanwinkle! See See https://github.com/jedcn/reveal-ck/pull/102 for
  details.

## 3.9.1 / 2018-12-25

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.9.0...v3.9.1)

### Added

* Nothing

### Changed

* Modified reveal-ck to rebuild *only* when the slides file changes. Previously
  it would build if anything underneath the current directory changed that
  wasn't in `slides/`. Fixes #98. Thanks to @agate-pris for pointing this out.

### Fixed

* Make it so that reveal-ck takes the specified or implied output directory
  into account when running `reveal-ck serve`. Fixes #99. Thanks to @agate-pris
  or testing!

## 3.9.0 / 2018-11-30

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.8.1...v3.9.0)

### Added

* Nothing

### Changed

* Upgraded reveal.js from v3.5.0 -> v3.7.0. Thanks @justin-vanwinkle!

### Fixed

* Nothing.

## 3.8.1 / 2018-11-25

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.8.0...v3.8.1)

### Added

* Nothing

### Changed

* Updated the version of rack
* Minor (shouldn't have a functional impact) tweaks to source

### Fixed

* reveal-ck serve no longer shows `error: undefined method `sub' for
  nil:NilClass` when no slides file is present. This fixes #80.

## 3.8.0 / 2017-06-20

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.7.0...v3.8.0)

### Added

* Any file ending in *.js in the js/ directory will now be added as a <script>
  tag.
* Any file ending in *.js in the plugin/ directory will now be configured to be a reveal.js plugin.
* Putting these two items together: reveal-ck now supports reveal.js plugins.

### Changed

* Nothing

### Fixed

* Nothing.

## 3.7.0 / 2017-06-10

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.6.0...v3.7.0)

### Added

* Nothing

### Changed

* The embedded version of reveal.js has been updated to version 3.5.0. See
  https://github.com/hakimel/reveal.js/releases/tag/3.5.0 for details.

### Fixed

* Nothing.

## 3.6.0 / 2017-04-23

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.5.1...v3.6.0)

### Added

* By default, the <head prefix="XYZ"/> value now supports
  http://ogp.me/. This is configurable.

  Additionally, it is now possible to supply <meta>s with properties
  and names by putting entries into the config.yml.

  Big thanks to @sue445 without which this wouldn't have happened.

  See https://github.com/jedcn/reveal-ck/pull/82 for details.

### Changed

* Nothing

### Fixed

* Nothing.

## 3.5.1 / 2017-01-14

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.5.0...v3.5.1)

### Added

* Nothing

### Changed

* Upgraded several libraries to more recent versions.
* Dropped support for older versions of ruby: 2.0.x and 2.1.x.

### Fixed

* Nothing.

## 3.5.0 / 2017-01-07

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.4.0...v3.5.0)

### Added

* When running `reveal-ck serve`, you can now specify the host you'd
  like to use. `reveal-ck` still defaults to localhost, but you can
  supply values like 0.0.0.0. See
  https://github.com/jedcn/reveal-ck/pull/79 for details.

### Changed

* Nothing

### Fixed

* Nothing.

## 3.4.1 / 2016-12-11

### Added

* You can now use Markdown in slide notes. See
  https://github.com/jedcn/reveal-ck/issues/68 for details.

* kramdown is the new markdown rendering engine. It replaces
  redcarpet. The primary rationale is to provide an extension within
  markdown that supports specifying classes to rendered HTML
  elements. See https://github.com/jedcn/reveal-ck/issues/71 for
  details.

### Changed

* WEBrick is now started with the "DoNotReverseLookup" flag. See
  https://github.com/jedcn/reveal-ck/issues/70 for details.

### Fixed

* Nothing.

## 3.3.1 / 2016-06-04

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.3.0...v3.3.1)

### Added

* Nothing.

### Changed

* Slight tweaks to please Rubocop.
* Using new version of html-pipeline

### Fixed

* Previously, you could not generate files into a directory with a
  character such as `+`. Now you can.

### 3.3.0 / 2015-09-26

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.2.0...v3.3.0)

### Added

* This project now provides a RakeTask that you can use to generate
  slides. See [features/rake_task.feature](features/rake_task.feature)
  for usage.

### Changed

* The travis build infrastructure now contains 2.0.0, 2.1.x, and
  2.2.x.

* Upgrading the listen gem should eliminate #58.

* Upgrading the html-pipeline gem should change the nokogiri gem,
  which should eliminate #33.

* The gems that reveal-ck requires have been upgraded to the latest
  ones available as of September 2015. Gems needed as runtime
  dependencies have been locked, and Gems needed for development
  dependencies have been constrained to supply a modern development
  environment.

* Generated slides used to be put in `slides/` unless you supplied the
  `--dir` option. Now, if you're using a `--file` option and your
  slides are named `great_talk.md` your generated slides will be in a
  directory of a similar name: `great_talk/`. See
  [features/generate-with-alt-dir.feature](features/generate-with-alt-dir.feature)
  for info.

### Fixed

* :emoji: are now properly aligned. Previously, they looked ok in an
  `h1`, but looked progressively worse as line-height got smaller--
  say, in a `<p>`. They were vertically "off." Thanks
  [@kbrock][kbrock]!

* rubocop warnings and erroneous error messages regarding tilt were
  eliminated. Thanks [@kbrock][kbrock]!

### 3.2.0 / 2015-05-29

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.1.0...v3.2.0)

This release allows you to supply a new configuration option in your
`config.yml`: `requires`

This configuration option is list of things that will be required in
when creating a presentation. It has been most useful for pulling in
`HTML::Pipeline::Filter`s that are configured via the `filters` in the
same `config.yml`.

It also supplies a bug fix for
https://github.com/jedcn/reveal-ck/issues/45, in which font files were
missing, and 404s were being returned.

There was also a fix for some erroneous output when running specs.

Big thanks to [@kbrock][kbrock]!

[kbrock]: https://github.com/kbrock

### 3.1.0 / 2015-05-09

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.0.1...v3.1.0)

This release allows you to add a description to your configuration,
and this description will appear in the generate slides as a <meta>
tag.

### 3.0.1 / 2015-03-01

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v3.0.0...v3.0.1)

This release upgraded all dependencies to their latest, locked them at
that version, and made slight tweaks to ensure that reveal-ck worked
with them.

The version locking is based on the idea that bugs were coming up that
were likely do to the range of libraries reveal-ck "could probably"
work with (but it couldn't quite work with them), and the fact that
there wasn't much benefit from trying to work with more than what we
needed.

Guard was the "most difficult" upgrade because of how its API changed,
so there may be some lurking issues.

It also dropped support for textile. This came in over 2 years ago,
but, I've never heard of anyone using it (or being psyched to know it
was an option).

### 3.0.0 / 2015-01-23

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.6.2...v3.0.0)

This release makes it so that the presentations generated by reveal-ck
match up with the 3.0.0 release of reveal.js. For example-- the new
default theme is "black," and the "white" theme is now available.

See https://github.com/hakimel/reveal.js/releases/tag/3.0.0 for
details. It's so cool.

### 0.6.2 / 2015-01-19

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.6.1...v0.6.2)

#### Bug Fix: Escape HTML characters in Markdown code snippets

This is a fix for Issue #32.

reveal-ck now escapes HTML characters in markdown code snippets.

Thanks to [@skirino][skirino] for both reporting the issue and fixing it!

[skirino]: https://github.com/skirino

### 0.6.1 / 2015-01-09

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.6.0...v0.6.1)

#### Bug Fix: Support emoji like :money_with_wings:

When using markdown, emoji with two underscores wasn't being handled
correctly. Same issue impacted two emoji, each with a single
underscore, on the same line.

### 0.6.0 / 2014-11-01

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.5.1...v0.6.0)

#### Feature: Support GFM Markdown for Tables

This is a fix for Issue #21.

In short, you can now write something like this:

```markdown
Item          | Value         | Quantity
------------- | ------------- | ---------
Apples        | $1            |       18
Lemonade      | $2            |       20
Bread         | $3.50         |        2
```

And reveal-ck should turn it into a table and apply the latest
reveal.js styling to it.

#### Feature: Provide Markdown notation for Vertical Slides

People have long asked for a notation within Markdown that supports
vertical slides.

This is now possible, and an `***` gets things going.

### 0.5.1 / 2014-11-01

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.5.0...v0.5.1)

#### Bug: Fix a Hanging Issue

The latest version of a dependent library switched an api invocation
from asynchronous to asynchronous, and so `reveal-ck serve` started
hanging.

### 0.5.0 / 2014-10-12

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.4.2...v0.5.0)

#### LiveReload!

Running the `reveal-ck serve` command used to *just* run a
webserver. It now also provides two more pieces of functionality:

1. It listens for file system changes, and if it sees them, it
   rebuilds your slides.
2. When your slides are rebuilt, it reloads your browser.

No browser plugins required!

This is *only* possible due to:

* [guard-livereload][https://github.com/guard/guard-livereload/]
* [rack-livereload][https://github.com/johnbintz/rack-livereload/]
* [listen][https://github.com/guard/listen]

### 0.4.2 / 2014-09-27

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.4.1...v0.4.2)

#### Fix Issue #16

You can now create "vertically tight" slide content.

#### Fix Issue #14

The description and version are now back if you type reveal-ck --help

### 0.4.1 / 2014-07-16

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.4.0...v0.4.1)

#### Fix Issue #13

reveal-ck 0.4.0 was locked on html-pipeline 1.8, and this stopped
working when 1.9 came out. And so, this change locks us onto
1.9. We'll see how often this happens..

### 0.4.0 / 2014-06-21

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.3.0...v0.4.0)

#### Ruby 1.9.3 is no longer supported

It's now 2.0 and 2.1.

#### Easier Speaker Notes in Markdown

You can now use a triple-fenced code block with "note" or "notes"
within markdown and instead of being code.. what you put within the
"note" will appear as a speaker note.

See [generate-with-markdown.feature][generate-with-markdown.feature].

#### Emoji Support

You can now type :thumbsup: within a slide and it'll display as emoji.

See [emoji.feature][emoji.feature].

#### AutoLinking Support

When you write out a URL like "http://github.com/" it'll be
transformed into an actual link.

See [auto-link.feature][auto-link.feature].

#### Mention Support

When you write out @jedcn within a slide, it'll become a link to that
users page on github.com (https://github.com/jedcn).

See [mention.feature][mention.feature].

[generate-with-markdown.feature]: features/generate-with-markdown.feature#L47
[emoji.feature]: features/emoji.feature
[auto-link.feature]: features/auto-link.feature
[mention.feature]: features/mention.feature


### 0.3.0 / 2014-06-08

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.2.0...v0.3.0)

#### CSS Inclusion

If you have a reveal.js presentation, and you'd like to tweak some
CSS, create a directory named `css/` and put your tweaks into a css
file in that directory. The file you create will automatically be
included in your presentation and `<link>`ed to.

See [generate-with-css.feature][generate-with-css.feature].

#### Media inclusion

Any files in the `media/` directory are now included in your
presentation.

See [generate-with-media.feature][generate-with-media.feature].

#### JS inclusion

Any files in the `js/` directory are now included in your
presentation.

See [generate-with-js.feature][generate-with-js.feature].

#### `slides.html` is now supported

You can now create slides using vanilla HTML.

See [generate-with-html.feature][generate-with-html.feature].

#### `slides.html.erb` is now supported

You can now create slides using HTML and erb.

See [generate-with-erb.feature][generate-with-erb.feature].

#### `config.yml` now allows to override reveal.js init

You can now supply the standard reveal.js configuration options in
`config.yml`

Add a top level `revealjs_config` and then use the key/values that
reveal.js expects. For example:

```yaml
revealjs_config:
  autoSlide: 5000
  loop: true
```

See
[generate-with-initial-js-options.feature][generate-with-initial-js-options.feature].

[generate-with-css.feature]: features/generate-with-css.feature
[generate-with-media.feature]: features/generate-with-media.feature
[generate-with-js.feature]: features/generate-with-js.feature
[generate-with-html.feature]: features/generate-with-html.feature
[generate-with-erb.feature]: features/generate-with-erb.feature
[generate-with-initial-js-options.feature]: features/generate-with-initial-js-options.feature

#### Updated reveal.js

It is now: 131c0068.

#### Started using RelishApp

You can find the results here:

https://www.relishapp.com/jedcn/reveal-ck/

### 0.2.0 / 2013-12-26

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.8...v0.2.0)

#### Update to embedded reveal.js

It is now: 8b8cc607.

#### Create Slides with Textile

You can now create slides with textile. Supply a `slides.textile` and
run `reveal-ck generate`.

#### reveal-ck serve now starts webserver

Some aspects of reveal.js only function when the reveal.js files are
retrieved from a webserver. The most important example of this are the
"Speaker Notes." You can now run `reveal-ck serve` (or `reveal-ck
server`) to start up a webserver, and then press "s" to see Speaker
Notes.

#### reveal-ck generate now prints basic message

reveal-ck generate now prints out a simple message when generate
slides. This message indicates which "slides file" is being
processed. Was getting confused with the growing number of file types
and ability to select a file explicitly.

#### Create Slides with Markdown

You can now create slides with markdown. Previously, you created
slides with haml, slim, or ruby. You'd create a `slides.haml`,
`slides.slim`, or a `slides.rb` and then run `reveal-ck generate`. You
can now create a `slides.md` and do the same.

It's the markdown you'd expect with one exception: you separate slides
with `---`.

### 0.1.8 / 2013-11-02

[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.7...v0.1.8)

#### image.slim: optional height and width

Previously, I thought height and width were required. If you know
them, you should add them, but reveal.js just "front-end magic" to
make things ok. If you don't include them, and your first slide is an
image, I think you'll experience a jump of content as the image
resizes to appropriate dimensions.

#### Less Restrictive Dependencies

Previously, most dependency requirements were written in such a way
that we wouldn't work with new minor releases.

Now they are written so that we accept anything that's backwards
compatible.

#### No more TOML. There is only YAML.

The central configuration file is now `config.yml` instead of
`config.toml`.

#### Update to embedded reveal.js

It is now: 9da292.

### 0.1.7 / 2013-09-29
[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.6...v0.1.7)

#### Metadata in DSL + config.toml

There was an issue where optins like "author" or "title" weren't being
respected when set in the DSL.

Further, config.toml settings used to always take precedence over the
DSL. No longer.

#### transition support

Whether in config.toml or the DSL, you can now supply "transition" to
impact how the slides change.

#### --file

You can now explicitly call out the name of your slides file. It used
to have to be one of: `slides.haml`, `slides.slim`, or
`slides.rb`. Pass in `--file` ala: `reveal-ck generate --file
/tmp/my_slides.haml`

#### contents_of

A helper function, `contents_of` is now available to be invoked in
slim and haml templates, and in the ruby dsl.

This function takes a single argument, normally a relative path, and
inlines the text returned by reading that file.

This lets you keep things like code-snippets in a "code/" directory.

#### Template Rename: title -> intro

The template named "title" has been renamed to "intro".

### 0.1.6 / 2013-09-23
[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.5...v0.1.6)

#### Tweak to Presentation DSL

The "DSL" around presentations and slides has changed
slightly. There's now a top level "presentation do" at the top of it
all, ala:

```
presentation do

end
```

#### Tweaks for Clarity, Readability

I've started using SimpleCov, Cane, Reek, Rubocop, and CodeClimate to
motivate towards simplicity. Examples include:

* Adding Basic Documentation for each Class (Cane)
* Eliminating areas of code that were unused (SimpleCov)
* Simplifying larger methods (CodeClimate, Reek)
* Adhering to basic Style Guide standards (rubocop)

### 0.1.5 / 2013-09-17
[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.4...v0.1.5)

#### DSL(ish)

The beginnings of a slide "DSL" is in the works, and you can now
create a `slides.rb` instead of a `slides.haml` or a `slides.slim`

#### Templates of Popular Slides

The class 'Slide' doesn't know about specific HTML content, and
instead provided a reference to a template (slim, haml) when it is
creatd. You can supply your own templates, but reveal-ck (the gem)
provies several common ones for a title screen, an image slide, a
quote slide, a code slide, and a text slide.

#### Programmatic Slides

Classes like 'Slide' and 'Presentation' have been introduced and you
can use these to create a slide deck. See
`examples/programmatic-slides.rb` for an example.

### 0.1.4 / 2013-09-09
[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.3...v0.1.4)

#### Slim Support

You can now author slides in either Slim or Haml. Choose which by
supplying a `slides.haml` or a `slides.slim`.

### 0.1.3 / 2013-07-09
[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.2...v0.1.3)

#### Config

Via a config file, you can now:

* Use a theme other than the default
* Supply a `<title>` for your slides
* Supply `<meta/>` author information

To achieve this, create a config.toml in the same directory as your
slides.haml. The contents should look like:

```
author = "Your Name"
title = "Your Presentation's Name"
[presentation]
theme = "night"
```

#### Markdown

You can now supply slide content via markdown (in haml..). It looks
like:

```haml
%section
  :markdown
    # Hey Now
    ## Alright
```

#### Update to embedded reveal.js

reveal-ck works by unpacking an embedded version of reveal.js when
creating slides. In prior versions, this was locked at a commit dating
to January 2013. It's now been updated to around the end of June 2013.

In short, it was: f3b488. And now it is: 7d19b4.

### 0.1.2 / 2013-07-06
[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.1...v0.1.2)

#### Bug Fixes

* Avoid 'desc is not a method' error when running reveal-ck generate.
  There was an unexpected interaction between Rake and GLI 2.7.

#### Enhancements

* Additional Documentation

#### Infrastructure

* Swapped out .rvmrc for .ruby-version
* Moved from Jeweler to Bundler for Gem Management

### 0.1.1 / 2013-02-15
[Detailed Changes](https://github.com/jedcn/reveal-ck/compare/v0.1.0...v0.1.1)

#### Enhancements

* Move generated slides.html to slides/slides.html
