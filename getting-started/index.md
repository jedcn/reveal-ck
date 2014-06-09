---
layout: child
title: Getting Started
---

# Getting Started

<p class="lead">
<a href="http://rubygems.org/gems/reveal-ck">reveal-ck is a ruby
gem</a>.
</p>

To get going, you install the gem, put some content into a file named
`slides.md`, and then run `reveal-ck generate` from the command line.

Let's go through those steps one by one.

## Installation

<p class="lead">
To get going, you need a relatively modern ruby (1.9 or greater).
</p>

Once you've got that, reveal-ck installs as a standard gem:

```
gem install reveal-ck
```

## First Presentation

<p class="lead">
Now that you have the gem, create a new file named `slides.md` and
put the following into it:
</p>

```
# Slides

### with Ruby?

---

# Awesome!
```

By default, reveal-ck looks for files that match `slides.*`. In this
case it will find `slides.md` and generate your slides from it.

When translated from markdown into HTML, it looks, roughly, like:

{% highlight html %}
<section>
  <h1>Slides</h1>
  <h3>with Ruby?</h3>
</section>
<section>
  <h1>Awesome!</h1>
</section>
{% endhighlight %}

As you may have guessed, [reveal.js][reveal.js] treats each
`<section/>` as a distinct slide. We have two slides here.

When you're writing with markdown you don't need to know about
`<section>`s. Instead-- save that knowledge for another time and just
remember that you add `---` to separate slides.

## Generating Slides

<p class="lead">
Once you've saved that content, run the following command:
</p>

```
reveal-ck generate
```

This command will transform the markdown into HTML and then integrate
that HTML into a reveal.js presentation. It builds out the result in
the `slides/` directory.

To see what was created just now, open `slides/index.html` in a
browser. If you're on MacOS you can type: `open slides/index.html`.

# What Next?

<p class="lead">
This first step created a presentation from markdown..
</p>

Markdown gives you access to images, various headings, lists of items,
code snippets, and quotes.

We recommend that you keep going down this path until you want more
control over what's produced. For many of our friends that day has
never come.

<p class="lead">
What are the limits of markdown? It can't easily create vertical
slides, background images, or provide text treatments.
</p>

If you'd like to get these things, then you'll need to use something
with more expressiveness. Your choices are: html, erb (within html),
haml, slim, or ruby itself.

We've written up a few introductions for haml, slim, and ruby.

If you're a haml specialist, then
[check out more information about haml][haml].

If you'd prefer slim, then
[check out more information about slim][slim].

If you'd like to learn about creating slides with ruby,
[check out more information about ruby][ruby].

<p class="lead">
Whether you stick with markdown or pick another language, you can
tweak your presentation with <code>config.yml</code> settings. Be sure
to check out the <a href="">configuration page</a> for the details.
</p>

[reveal.js]:     http://lab.hakim.se/reveal-js/#/
[haml]:          ../haml
[ruby]:          ../ruby
[slim]:          ../slim
