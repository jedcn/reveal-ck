# Create Slides with Markdown

## reveal-ck is..

a command line tool that helps you author [reveal.js][reveal.js]
presentations.

[reveal.js]: http://lab.hakim.se/reveal-js

It lets you focus on the content of your presentation by taking care
of the details of building a reveal.js presentation.

You write your presentation in markdown, in a single file, and
reveal-ck generates everything else.

## Get Started Now

Here's a [quick example][quick-example] so you can see what using
reveal-ck is like.

[quick-example]: docs/QUICK-EXAMPLE.md

## Learning More

There are many, many things you can do to customize your slides!

Here's a long, but not exhaustive, list of things you can do:

* Get fast feedback with LiveReload. Save your slides and instantly
  see the result.
* Host your slides up on Github Pages.
* Use any emoji available on github, such as `:money_with_wings:`
* Take advantage of reveal.js' vertical slides
* Use Github Flavored Markdown Tables
* Write your slides in HTML or popular Ruby templating languages, like
  ERB and Haml, and Slim.
* Easily support CSS tweaks.
* Use `@mentions`, such as, @jedcn.
* Manage configuration of themes and plugins in a single config file.
* Integrate with `rake` (ie: create rake tasks that build slides)

## Installation

`reveal-ck` is delivered as a RubyGem, and so, you need Ruby 2.0+ and
then installing should be as easy as:

    gem install reveal-ck

Verify that things are functional and you have the latest version of
reveal-ck by typing:

    reveal-ck --version

## Questions?

Not everything is documented, and nothing is perfect, so-- if you'd
like to [ask a question or log a bug please do so][new-issue]!

[new-issue]: https://github.com/jedcn/reveal-ck/issues/new

## Contributing

[![Gem Version](https://badge.fury.io/rb/reveal-ck.svg)](http://badge.fury.io/rb/reveal-ck)
[![Build Status](https://travis-ci.org/jedcn/reveal-ck.svg)](https://travis-ci.org/jedcn/reveal-ck)
[![Code Climate](https://codeclimate.com/github/jedcn/reveal-ck/badges/gpa.svg)](https://codeclimate.com/github/jedcn/reveal-ck)
[![Test Coverage](https://codeclimate.com/github/jedcn/reveal-ck/badges/coverage.svg)](https://codeclimate.com/github/jedcn/reveal-ck)

If you're a ruby developer and you want to get going with local
development, please see [.github/CONTRIBUTING.md][CONTRIBUTING.md].

[CONTRIBUTING.md]: .github/CONTRIBUTING.md
