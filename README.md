# Create Slides with Markdown

[![Gem Version](https://badge.fury.io/rb/reveal-ck.svg)](http://badge.fury.io/rb/reveal-ck)
[![Build Status](https://travis-ci.org/jedcn/reveal-ck.svg)](https://travis-ci.org/jedcn/reveal-ck)
[![Code Climate](https://codeclimate.com/github/jedcn/reveal-ck/badges/gpa.svg)](https://codeclimate.com/github/jedcn/reveal-ck)
[![Test Coverage](https://codeclimate.com/github/jedcn/reveal-ck/badges/coverage.svg)](https://codeclimate.com/github/jedcn/reveal-ck)

## Overview

reveal-ck is a command line tool that helps you author
[reveal.js][reveal.js] presentations.
[reveal.js]: http://lab.hakim.se/reveal-js

It lets you focus on the content of your presentation by taking care
of the details (HTML, JavaScript) behind building a reveal.js
presentation.

You write your presentation in markdown, in a single file, and
reveal-ck generates everything else.

## Installation

`reveal-ck` is delivered as a RubyGem, and so, you need Ruby 2.0+ and
then installing should be as easy as `gem install reveal-ck`.

Verify that things are functional and you have the latest version of
reveal-ck by typing `reveal-ck --version`.

## Basic Usage

Here's a [quick example][quick-example] so you can see what using
reveal-ck is like.

[quick-example]: doc/QUICK-EXAMPLE.md

## Question?

Not everything is documented, and nothing is perfect, so-- if you'd
like to [ask a question or log a bug please do so][new-issue]!

[new-issue]: https://github.com/jedcn/reveal-ck/issues/new

## Learning More

There are many, many things you can do to customize your slides!

Here's a long, but not exhaustive, list of things you can do:

* Get fast feedback between text editor and browser using LiveReload
* Take advantage of reveal.js' vertical slides
* Host your slides up on Github Pages.
* Use any emoji available on github, such as `:money_with_wings:`
* Use Github Flavored Markdown Tables
* Write your slides in HTML or popular Ruby templating languages, like
  ERB and Haml, and Slim.
* Easily support CSS tweaks.
* Use `@mentions`, such as, @jedcn.
* Manage configuration of themes and plugins in a single config file.

## Contributing

If you're a ruby developer and you want to get going with local
development, please see [CONTRIBUTING.md](CONTRIBUTING.md).
