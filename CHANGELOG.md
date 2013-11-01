### Development
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.7...next-release)

#### Less Restrictive Depdencies

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
