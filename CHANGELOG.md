### Development
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.4...master)

Nothing Yet..

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
