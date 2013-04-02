# reveal-ck: a [reveal.js](http://lab.hakim.se/reveal-js/) construction kit

[![Build Status](https://travis-ci.org/jedcn/reveal-ck.png)](https://travis-ci.org/jedcn/reveal-ck)

## Overview

This project is the home of a gem named `reveal-ck` that lets you
quickly author [reveal.js](http://lab.hakim.se/reveal-js/)
presentations.

The gem provides an executable of the same name, `reveal-ck`, that can
take a single file as input and generate a set of slides from it.

Here's a starter repository that contains everything you need to get
going with reveal-ck: https://github.com/jedcn/reveal-ck-template in
less than 5 minutes.

The hope is that you will be able to leverage all of the power,
beauty, and functionality that comes from reveal.js while focusing
entirely on the actual content and ideas you are trying to get across.

As with all [reveal.js](http://lab.hakim.se/reveal-js/) presentations,
you can show these to other people on an iPhone, iPad, or present them
in your browser.

### What You Provide

You provide:

* A file containing your slide content in HAML (`slides.haml`)

* (optional) If you have any images that are not already on the web,
  you can save these into a directory named `images` and the contents
  will be bundled up into your generated slides. This will allow you
  to relatively reference the images.

## Getting Started

At present, we assume you've got a functional Ruby 1.9.x environment
up and running one way or another and bundler.

If that's the case, try the following:

```
$ git clone git@github.com:jedcn/reveal-ck-template.git
Cloning into 'reveal-ck-template'...
remote: Counting objects: 12, done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 12 (delta 2), reused 12 (delta 2)
Receiving objects: 100% (12/12), done.
Resolving deltas: 100% (2/2), done.
$ cd reveal-ck-template
$ bundle
Fetching gem metadata from https://rubygems.org/......
Installing rake (10.0.4)
Installing gli (2.5.6)
Installing tilt (1.3.6)
Installing haml (4.0.1)
Installing reveal-ck (0.1.1)
Using bundler (1.2.3)
Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.
$ reveal-ck generate
$ open slides/index.html
```

If all has gone well, you should now have a `slides/` directory and if
you open up `slides/index.html` in a browser, you should see a
reveal.js presentation that was generated from the `slides.haml`

## Authoring Slides

Now that you are assured of basic functionality, start making changes
and customizing `slides.haml`. Once you've made a change you'd like to
see, re-run `reveal-ck generate` and then re-open (or refresh)
`slides/index.html`

[reveal.js](http://lab.hakim.se/reveal-js/) has a great
[live demo](http://lab.hakim.se/reveal-js/), and if you take a look at
the source in the demo, you can quickly see the HTML and CSS that has
good support by default when placed into your `slides.haml`.

## Why not just clone reveal.js?

Or why not use http://www.rvl.io/ which offers a WYSIWYG experience?

You can! For sure.

The whole reveal.js offering is great.

If reveal-ck's approach is too contrived or doesn't warrant the setup
time, skip it!

## Then.. why would anyone use reveal-ck?

The thought behind this project to help you focus on what *you* want
to say.

For me, focusing becomes easier and my thoughts clearer when I reduce
the list of slides to a single file (```slides.haml```). It only
contains the slide content I am presenting and there's minimal markup.

HAML isn't the most readable thing (say, compared to markdown), but it
is decent, and sharing or reviewing something like ```slides.haml```
is easier than reviewing the final presentation:

* If you look at the presentation in a browser, you can't scan all of
  the slides at once. You need to visit them. If you're looking at
  ```slides.haml``` you can quickly scan through 30+ slides.

* If you look at the html behind the presentation (say, view source),
  there's a bunch of stuff that makes the magic happen: styles,
  javascript, etc.

Finally, if you track your slides in a system like git, you can get
meaningful diffs between versions of ```slides.haml```. This is
slightly easier than if you track the generated presentation.

In the end, the presentation framework,
[reveal.js](http://lab.hakim.se/reveal-js/), can make things pretty,
but only you can make a presentation that is worthwhile.

[talk-learning-with-tools-source]: https://github.com/jedcn/talk-learning-with-tools
[talk-learning-with-tools-result]: http://www.jednorthridge.com/talks/learning-with-tools
