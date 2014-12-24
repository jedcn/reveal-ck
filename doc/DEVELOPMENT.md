# Development

This document is meant to describe the Overall Design behind reveal-ck
as well as describe which tools are used for local development and
cloud support.

## Overall Design

reveal.js is a very popular HTML presentation framework, and there are
dozens of tools for creating reveal.js presentations. Why did I create
reveal-ck? Why should you use reveal-ck?

There are two fundamental ideas at play:

* The RubyGems format allows us to combine all of the files that make
  up a reveal.js presentation into a nice, easily downloaded package.
* Users supply a minimal file that represents their custom
  presentation content.

Putting these two together, reveal-ck can transform this into HTML and
splice it into the reveal.js presentation.

This means that users of reveal-ck can allow reveal-ck to encapsulate
the details of what is in a reveal.js presentation and solely focus on
their talk.

### Ruby + :heart: = HTML

Ruby is good at creating HTML, and reveal-ck aims to re-use as much
common, ruby-based, html producing infrastructure as possible.

reveal-ck isn't about original work so much as it is about plugging
together existing tools to conveniently produce a presentation.

Some examples:

* reveal-ck uses a library named [rtomayko/tilt][github-tilt] and this
  makes it easy to support formats like markdown, html, erb, haml,
  slim. This is the same library behind the Rails asset pipeline.
* reveal-ck uses an html filtering framework named
  [jch/html-pipeline][github-html-pipeline] to get automatically get
  support for things like GFM Tables, Emoji, autolinking, and
  @mentions. This is the same library that's used on
  https://github.com when you are writing comments.

And so, by using these famous libraries, reveal-ck can get a bunch
done without re-inventing the wheel.

[github-tilt]: https://github.com/rtomayko/tilt
[github-html-pipeline]: https://github.com/jch/html-pipeline

### What does this mean if you're looking to do development?

If you've got something you'd like to add, or something you'd like to
fix, I recommend that you start by opening up an Issue.

However-- your frame of mind *should likely* be based on re-using or
customizing a popular ruby library rather than brute-forcing the
creation of something new.

## Local Setup and Support

### Pre-requisites

As a gem, reveal-ck supports ruby 2.0.0 and above, and so, you should
switch to either ruby 2.0 or 2.1 instead of 1.8 or 1.9.

### Getting Started

Begin by verifying that things are in a good state on your machine by
running the following commands in a terminal:

```
git clone https://github.com/jedcn/reveal-ck.git
cd reveal-ck
git submodule init && git submodule update
bundle
rake
```

This is the equivalent of what https://travis-ci.org/jedcn/reveal-ck
runs.

These should execute successfully- please open up an
[issue][reveal-ck-has-issues] if they do not.

[reveal-ck-has-issues]: https://github.com/jedcn/reveal-ck/issues/

### A Submodule?

Each published reveal-ck gem contains a copy of reveal.js at a
discrete SHA. When reveal-ck generates a presentation, it begins by
unpacking this copy of reveal.js, and then modifying it to include a
user's content, css, images, etc.

When you're doing local development-- you need a copy of reveal.js,
and this is achieved via a git submodule. That's why the commands
above include a `git submodule init` and a `git submodule update`.

### Specs

The reveal-ck project contains unit tests, and they are written in
rspec.

They can be executed in the following ways:

1. `rake spec`
2. `rspec`
3. `bundle exec rspec`

reveal-ck tracks coverage with simplecov, and coverage will be
available after specs run at `coverage/index.html`.

reveal-ck aims for 100% coverage, but **does not** fail builds if it
doesn't get it.

### Style, Code Complexity, Conformance

Coding guidelines and basic checking are enforced via rubocop.

They can be executed in the following ways:

1. `rake rubocop`
2. `rubocop`
3. `bundle exec rubocop`

reveal-ck aims for explicit adherence to these guidelines, and
**does** fail builds if it doesn't get it.

reveal-ck presumes that rubocop represents the will of the ruby
community, and so, reveal-ck code adapts to rubocop's defaults.

It's ok to "opt-out" of these guidelines if they don't make sense, but
this should be done for a good reason, and needs to be made explicit
via inline rubocop settings or a directory specific `.rubocop.yml`.

### Acceptance Tests

Acceptance tests are based on cucumber and aruba.

In case you're not familiar, Aruba is a framework for testing command
line applications. Whenever it verifies a Scenario within a Feature
Aruba creates some space at `./tmp/aruba` and then runs
reveal-ck. Once reveal-ck completes, aruba provides a number of Step
Definitions that aid in verifying contents on the file system or
within a file.

Aruba works within Cucumber, and all of the Acceptance Tests can be
executed in the following ways:

1. `rake cucumber`
2. `cucumber`
3. `bundle exec cucumber`

Features are saved in `features/` and aruba is used to invoke
reveal-ck from the command line to generate slides for acceptance.

The spirit of these tests relies on generating slides and then
asserting details about the output. Many of the asserts are based on
exit codes, standard out, and xpath run against the resulting html.

### Specs + Style + Acceptance = CI

Putting all of this together, and popping the stack to the Getting
Started section, you can run all three of these in serial with the
following:

1. `rake`
2. `rake ci`

## Cloud Support

reveal-ck enlists the help of several "cloud" services:

* Github Pages: http://jedcn.github.io/reveal-ck/
* Travis CI: https://travis-ci.org/jedcn/reveal-ck
* RelishApp: https://www.relishapp.com/jedcn/reveal-ck
* CodeClimate: https://codeclimate.com/github/jedcn/reveal-ck

### Github Pages

A standalone website for the project is served via github pages, and
the follows the standard convention of jekyll and the contents of the
`gh-pages` branch.

### Travis CI

Travis CI is used for builds, and you can find the project page here:
https://travis-ci.org/jedcn/reveal-ck.

Travis runs a `rake` command and the default task is `rake ci`. This
mirrors what's described above.

### RelishApp

RelishApp hosts project documentation generated by the feature files
underneath `features`.

### Code Climate

Works alongside, and in addition to, rubocop. It provides analysis of
the reveal-ck code here:
https://codeclimate.com/github/jedcn/reveal-ck. This is manually
checked with each release.
