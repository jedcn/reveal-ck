# reveal-ck: a [reveal.js](http://lab.hakim.se/reveal-js/) construction kit

## Overview

The goal of this project is let you quickly author
[reveal.js](http://lab.hakim.se/reveal-js/) presentations.

It enables you to author revealjs-aware-[haml](http://haml.info/) that
serves as a stand-in
[DSL](http://en.wikipedia.org/wiki/Domain-specific_language) for
presentation slides.

The hope is that you will be able to leverage all of the power,
beauty, and functionality that comes from revealjs while focusing
entirely on the actual content and ideas you are trying to get across.

Rake commands are used to shoulder the work of actually building
presentations for review and distribution.

## Assumptions

This project assumes that you:

* are already familiar with [reveal.js](http://lab.hakim.se/reveal-js/)
* have a functional Ruby environment up and running (RVM recommended,
  but optional)
* are ok with running rake commands
* want to author the core content of your
  [reveal.js](http://lab.hakim.se/reveal-js/) slides using
  [haml](http://haml.info/).

## Getting Started

Here is the work flow that we are hoping to enable:

* Clone this project: ```git clone https://github.com/jedcn/reveal-ck```
* Setup the project: ```rake init```
* Create an initial presentation ```rake presentation```
* At this point, a presentation exists at ```index.html```
* Start making changes to ```slides.haml```
* As you make changes in ```slides.haml```, when you want to bring in
  reveal.js, run ```rake presentation``` and then open the resulting
  ```index.html``` in your browser (or refresh if you had it already
  open).

## Goals

The goal of [reveal-ck](https://github.com/jedcn/reveal-ck) is to help
you focus on what *you* want to say.

The presentation framework, revealjs, can make things pretty, but only
you can make a presentation that is worthwhile.

### Examples of slide DSL

I am not sure what this will look like yet, but here's the idea:

```haml
%section
  %h1 Reveal.js
  %h3 HTML Presentations Made Easy
  %p
    %small Created by
      %a{ href: 'http://hakim.se' } Hakim El Hattab /
      %a{ href: 'http://twitter.com/hakimel' } @hakimel

%section
  %h2 Heads Up
  %p
    reveal.js is a framework for easily creating beautiful
    presentations using HTML. You'll need a browser with support for
    CSS 3D transforms to see it in its full glory.
  %aside.notes
    Oh hey, these are some notes. They'll be hidden in your
    presentation, but you can see them if you open the speaker notes
    window (hit 's' on your keyboard).
```

## Some Thoughts

This is not perfect. Presentation aspects still bleed through into
what you are writing in the ```slides.haml```.

Even so if you look at the produced result (a really snazzy revealjs
presentation) and you look at the input (the contents of
```slides.haml```), you will usually see a pretty good ratio of raw
thought to handsome output with minimal work on your part. That is the
hope, anyway.

## Pro-Tips

This project does not really exist yet, but I am hoping we'll get
here:

* On MacOS, regenerate the slides and then open them up with:
  ```rake presentation && open index.html```
* If you have something like Guard, maybe we'll be able to setup a
  Guardfile so that any changes to slides.haml will cause
  ```rake presentation``` to be run, and then you will be able to hit
  save in your favorite editor and then refresh in your browser and
  see your changes.
* If we get that Guard thing going, or even if we do not, maybe we can
  work with [LiveReload](http://livereload.com/) and set something up
  where just saving ```slides.haml``` in your editor will cause your
  browser to refresh and grab the latest.

All of these are about cutting down on the time between your thought
and the feedback you get visually.
