# reveal-ck: a [reveal.js](http://lab.hakim.se/reveal-js/) construction kit

## Overview

The goal of this project is let you quickly author
[reveal.js](http://lab.hakim.se/reveal-js/) presentations.

It enables you to author "reveal.js-aware-[haml](http://haml.info/)"
that can conveniently be transformed into slides.

The hope is that you will be able to leverage all of the power,
beauty, and functionality that comes from reveal.js while focusing
entirely on the actual content and ideas you are trying to get across.

### What You Provide to reveal-ck

If you want to make some slides, you would provide:

* A file containing your slide content (`slides.haml`)
* A directory, `images`, containing any images you'd like to reference
  with `<img/>` within your slides.

### What You Get from reveal-ck

In return for this, you will be able to create slides that can be
placed anywhere on the web (or kept locally).

Having authored a `slides.haml`, you'd run a single command:
`reveal-ck generate` and your slides will be built (or rebuilt) in a
directory named `slides`

As with all [reveal.js](http://lab.hakim.se/reveal-js/) presentations,
you can show these to other people on an iPhone, iPad, or present them
in your browser.

### An Example

Here's an example of a project that tracks files used to build a set
of slides: [talk-learning-with-tools-source].

But, it is even simpler than that: if you look at
[talk-learning-with-tools] you'll see approximately 9 top level files.
Of these, only one is necessary to use reveal-ck: `slides.haml`.

* If you don't have any images, you could leave out the `images/`
  directory

* If you don't use RVM, you do not need the `.rvmrc`

* If you don't use Bundler, you do not need the `Gemfile` or the
  `Gemfile.lock`

* The files `README.md` and `notes.org` are things I use to support a
  talk. reveal-ck does not use them. Same goes for the `LICENSE` and
  the `.gitignore`

At any rate, if you focus on the `slides.haml` and the `images/` that
I chose to include, and imagined that you ran `reveal-ck generate`,
then you'd get this:

Here's an example of the output you'd get:
[talk-learning-with-tools-result].

## Getting Started

At present, we assume you've got a functional Ruby 1.9.x environment
up and running one way or another.

If that's the case, try the following:

* `gem instll reveal-ck`
* `echo -e "%section\n  Hello World" > slides.haml`
* `reveal-ck generate`

If all has gone well, you should now have a `slides/` directory and if
you open up `slides/index.html` in a browser, you should see a
reveal.js presentation with a single slide that says Hello World.

## Authoring Slides

Now that you are assured of basic functionality, start making changes
and customizing ```slides.haml```. Once you've made a change you'd
like to see, re-run ```reveal-ck``` and then re-open (or refresh) ```slides/index.html```

[reveal.js](http://lab.hakim.se/reveal-js/) has a great
[live demo](http://lab.hakim.se/reveal-js/), and if you take a look at
the source in the demo, you can get up and running quickly with things
that can be placed into your ```slides.haml```.

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
is decent and sharing or reviewing something like ```slides.haml``` is
easier than reviewing the final presentation:

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
