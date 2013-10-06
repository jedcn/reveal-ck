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

[basic-configured-slides]: http://jedcn.github.io/reveal-ck-example/basic-configured-slides
[basic-slides]: http://jedcn.github.io/reveal-ck-example/basic-slides
[haml]: http://haml.info/
[inline-slides]: http://jedcn.github.io/reveal-ck-example/inline-slides
[reveal-ck]: https://github.com/jedcn/reveal-ck
[reveal-js]: http://lab.hakim.se/reveal-js/#/
