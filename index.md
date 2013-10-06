---
layout: bare
title: reveal-ck
---

# reveal-ck
## a [reveal.js][reveal-js] construction kit

* * *

* Need to make slides?
* Don't want to leave your editor?
* Like Ruby?
* Check out reveal-ck!

* * *

## Slides?

In [reveal.js][reveal-js] each `<section>` represents a slide.

With [reveal-ck][reveal-ck], you put all your slide content into one
file.

You can write in [Haml][haml]:

{% gist 6839168 %}

Then run `reveal-ck` on the command line, and you end up with
[statically generated slides][basic-slides].

## Simple Config

[reveal.js][reveal-js] has built-in themes and transitions.

Need to switch away from the defaults?

Create a `config.toml`:

{% gist 6857103 %}

Then run `reveal-ck` again and end up with
[this][basic-configured-slides].

## Project Layout

Sometimes slides include content that would be better kept in a
separate file.

Feel free to lay things out as you like:

{% gist 6857518 %}

And, if you want to inline a file, use `contents_of`:

{% gist 6857599 %}

And here's [some slides with inlined code][inline-slides].

## Slides.. with Ruby?

[Haml][haml] and [Slim][slim] are awesome, but they are still
templating languages.

What about writing slides in Ruby?

When you create slides with Haml or Slim, you define your entire set
of slides in a __single__ file. When you write slides in Ruby, you
build up a simple collection of objects that contribute HTML back to
the overall presentation.

Support for this is based on tying an object together with a template.

Consider the following:

{% gist 6860278 %}

Two templates used here are: `intro` and `image`.

[reveal-ck][reveal-ck] comes with some sample templates, including the
[intro template][reveal-ck-intro-template].

Howver, you can also provide your own templates by placing them in the
`templates/` directory.

`image` is defined above as follows:

{% gist 6860333 %}

Writing slides in Ruby means you can build up slides
programmatically.

The web? A local database? A remote API? If Ruby can do it, you can
create slides from it.

If we run `reveal-ck` again, we query google, and
[here are the results][google-slides].

[basic-configured-slides]: http://jedcn.github.io/reveal-ck-example/basic-configured-slides
[basic-slides]: http://jedcn.github.io/reveal-ck-example/basic-slides
[google-slides]: http://jedcn.github.io/reveal-ck-example/google-slides
[haml]: http://haml.info/
[inline-slides]: http://jedcn.github.io/reveal-ck-example/inline-slides
[reveal-ck-getting-started]: https://github.com/jedcn/reveal-ck/blob/master/doc/getting_started.md
[reveal-ck-intro-template]: https://github.com/jedcn/reveal-ck/blob/master/templates/intro.slim
[reveal-ck]: https://github.com/jedcn/reveal-ck
[reveal-js]: http://lab.hakim.se/reveal-js/#/
[slim]: http://slim-lang.com/
