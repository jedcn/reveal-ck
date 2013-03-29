# reveal-ck: a [reveal.js](http://lab.hakim.se/reveal-js/) construction kit

[![Build Status](https://travis-ci.org/jedcn/reveal-ck.png)](https://travis-ci.org/jedcn/reveal-ck)

## Overview

This project is the home of a gem named `reveal-ck` that lets you
quickly author [reveal.js](http://lab.hakim.se/reveal-js/)
presentations.

The gem provides an executable of the same name, `reveal-ck`, that can
take a single file as input and generate a set of slides from it.

The hope is that you will be able to leverage all of the power,
beauty, and functionality that comes from reveal.js while focusing
entirely on the actual content and ideas you are trying to get across.

### What You Provide

You provide:

* A file containing your slide content (`slides.haml`)

* (optional) If you have any images that are not already on the web,
  you can save these into a directory named `images` and the contents
  will be bundled up into your generated slides. This will allow you
  to relatively reference the images.

### What You Get

Once you have a `slides.haml`, you'd run a single command: `reveal-ck
generate` and your slides will be built in a directory named
`slides/`.

In return, you will be able to create slides that can be placed
anywhere on the web (or kept locally).

As with all [reveal.js](http://lab.hakim.se/reveal-js/) presentations,
you can show these to other people on an iPhone, iPad, or present them
in your browser.

### An Example

This link leads to
[a set of slides that reveal-ck generated][talk-learning-with-tools-result].

If you were to look through these 43 or so slides, the important thing
to remember is that it was generated entirely from three files:

* [slides.haml](https://github.com/jedcn/talk-learning-with-tools/blob/master/slides.haml)
* [images/nodejam.png](https://raw.github.com/jedcn/talk-learning-with-tools/master/images/nodejam.png)
* [images/third_row.jpeg](https://raw.github.com/jedcn/talk-learning-with-tools/master/images/third_row.jpeg)

For total completeness, here's the repository that tracks the files
behind the slides: https://github.com/jedcn/talk-learning-with-tools.

While you might see a dozen or so different files being tracked in
that repository, the good majority of them are overhead used for
generally tracking a project:

* The `.rvmrc` is only present because it is using RVM

* The `Gemfile` and `Gemfile.lock` are only present because it is
  using Bundler.

* The files `README.md` and `notes.org` are things I use to support a
  talk that I am giving. reveal-ck is not aware of them.

## Getting Started

At present, we assume you've got a functional Ruby 1.9.x environment
up and running one way or another.

If that's the case, try the following:

* `gem instll reveal-ck`

* Using the editor of your choice, create a file named `slides.haml`
  with this content:

```haml
%section
  Hello World
```

* Finally, run: `reveal-ck generate`

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
