### 0.4.0 / 2014-06-??

[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.3.0...v0.4.0)

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

[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.2.0...v0.3.0)

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

[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.8...v0.2.0)

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

[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.7...v0.1.8)

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
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.6...v0.1.7)

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
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.5...v0.1.6)

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
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.4...v0.1.5)

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
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.3...v0.1.4)

#### Slim Support

You can now author slides in either Slim or Haml. Choose which by
supplying a `slides.haml` or a `slides.slim`.

### 0.1.3 / 2013-07-09
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.2...v0.1.3)

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
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.1...v0.1.2)

#### Bug Fixes

* Avoid 'desc is not a method' error when running reveal-ck generate.
  There was an unexpected interaction between Rake and GLI 2.7.

#### Enhancements

* Additional Documentation

#### Infrastructure

* Swapped out .rvmrc for .ruby-version
* Moved from Jeweler to Bundler for Gem Management

### 0.1.1 / 2013-02-15
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.0...v0.1.1)

#### Enhancements

* Move generated slides.html to slides/slides.html
