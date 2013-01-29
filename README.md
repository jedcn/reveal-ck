# reveal-ck: a [reveal.js](http://lab.hakim.se/reveal-js/) construction kit

## Overview

The goal of this project is let you quickly author
[reveal.js](http://lab.hakim.se/reveal-js/) presentations.

It enables you to author reveal.js-aware-[haml](http://haml.info/) that
can conveniently be transformed into slides.

The hope is that you will be able to leverage all of the power,
beauty, and functionality that comes from reveal.js while focusing
entirely on the actual content and ideas you are trying to get across.

This content will usually take the form of:

* A file containing your slides (```slides.haml```)
* A directory containing any images you'd like to reference relatively
  (```images```).

And, in return for this, you will be able to create slides that can be
placed anywhere on the web (or kept locally). As with all
[reveal.js](http://lab.hakim.se/reveal-js/) presentations, you can
show these to other people on an iPhone, iPad, or present them in your
browser.

Here's an example of the inputs you'd provide:
https://github.com/jedcn/talk-learning-with-tools

Here's an example of the output you'd get: Coming Soon

For a full sampling of everything
[reveal.js](http://lab.hakim.se/reveal-js/) can do, take a look at the
[live demo](http://lab.hakim.se/reveal-js/).

## Getting Started

At present, we assume you've got a functional Ruby 1.9.x environment
up and running.

If that's the case, try the following:

* clone this project
* run a ```bundle```
* run ```reveal-ck```

At this point, the sample ```slides.haml``` that came with the project
will be transformed into a set of slides. You can see the result by
opening up ```slides/index.html``` in your browser.

If you've made it this far, you've got the basic basic functionality
up and running.

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
