# FAQ

## General

### What if I run `reveal-ck generate` and it doesn't work?

Try creating a `Gemfile` that contains this:

```ruby
source 'https://rubygems.org'
gem 'reveal-ck'
```

And then running a `bundle` followed by a `bundle exec reveal-ck
generate`

There's been [at least one problem][library-conflict-issue] where this
has helped isolate libraries in use.

[library-conflict-issue]: https://github.com/jedcn/reveal-ck/issues/17]

### Is it possible to automatically advance the slides?

Yes, reveal.js supports this with a configuration option.

reveal-ck allows you to supply reveal.js configuration options via the
`config.yml` file.

Create a file named `config.yml` and add the following to it:

```yml
revealjs_config:
  autoSlide: 15000
```

This will create a presentation where each slide automatically advance
15 seconds.

You can add `loop` and set it to `true` if you want the slides to
repeat after they reach the end:

```yml
revealjs_config:
  autoSlide: 15000
  loop: true
```

## Markdown

### Can I put HTML into my markdown?

Sort of.

You can put HTML above or below your markdown, but it can't
intermingle. This is allowed in the definition of markdown as "inline
html."

Here's an example if you had a file named `slides.md`:

```markdown
# Introduction
---
## Thesis
* Point 1
* Point 2

<p class="fragment">
  Conclusion.. which was not initially visible
</p>
```

## Haml

### Can I put Markdown into my Haml?

Yeah, you can. This is achieved using the "Haml Markdown Filter."

Here's an example of putting markdown into a `%section` in a
`slides.haml`:

```haml
%section
  :markdown
    ## Thesis
    * Point 1
    * Point 2
```

## Videos

There are several videos that also **show** what's going on if you'd
like to see:

* [reveal-ck: An Introduction][reveal-ck-introduction] (4 mins)
* [reveal-ck: Getting Started with Markdown][reveal-ck-getting-started] (6 mins)
* [reveal-ck: Stop! Haml Time!][reveal-ck-stop-haml-time] (14 mins)
* reveal-ck: Making Slides with Ruby (Coming Soon?)

They were created so that you could watch them all in a row or jump in
wherever you'd like.

Please keep in mind that these videos pre-date having
live-reload. Everything in them is valid-- you just don't have to
switch contexts and run `reveal-ck generate` as much. :smile:.

[reveal-ck-introduction]: http://vimeo.com/jedcn/reveal-ck-introduction
[reveal-ck-getting-started]: https://vimeo.com/jedcn/reveal-ck-getting-started
[reveal-ck-stop-haml-time]: https://vimeo.com/jedcn/reveal-ck-stop-haml-time
