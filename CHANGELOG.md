### Development
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.5...master)

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
