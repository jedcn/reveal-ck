---
layout: bare
title: reveal-ck
---

# reveal-ck
## a [reveal.js][reveal-js] construction kit

* * *

#### Need to make slides?
#### Don't want to leave your editor?
#### Like Ruby?
#### Check out [reveal-ck][reveal-ck]!

* * *

## Slides?

In [reveal.js][reveal-js] each `<section>` represents a slide.

With [reveal-ck][reveal-ck], you put all your slide content into one
file:

{% gist 6839168 %}

You can write in [Haml][haml], [Slim][slim], or Ruby.

When you're ready, you run `reveal-ck` like so:

```
reveal-ck generate --file basic-slides.haml
```

Here are the [results][basic-slides].

## Simple Config

[reveal.js][reveal-js] has built-in [themes][reveal-js-themes] and
[transitions][reveal-js-transitions].

Need to switch away from the defaults?

Create a `config.toml`:

{% gist 6857103 %}

Then run `reveal-ck` on the command line:

```
reveal-ck generate --file basic-slides.haml
```

Here are the [results][basic-configured-slides].

## Project Layout

Sometimes slides include content that would be better kept in a
separate file.

Feel free to lay things out as you like:

{% gist 6857518 %}

And, if you want to inline a file, use `contents_of`:

{% gist 6857599 %}

Then run `reveal-ck` on the command line:

```
reveal-ck generate --file inline.haml
```

Here are the [results][inline-slides].

## Slides.. with Ruby?

[Haml][haml] and [Slim][slim] are awesome, but they are still
templating languages.

What about writing slides in Ruby? You can work in pure Ruby or you
can use reveal-ck's DSL.

Whichever path you choose, when you write slides in Ruby, you build up
a collection of objects that contribute HTML back to an overall
presentation.

Ruby maps to HTML by tying an object together with a template.

Consider the following example in the DSL:

{% gist 6860278 %}

Two templates used here are: `intro` and `image`.

[reveal-ck][reveal-ck] comes with some sample templates, including the
[intro template][reveal-ck-intro-template].

However, you can also provide your own templates by placing them in
the `templates/` directory.

{% gist 6932884 %}

`image` from the DSL maps to `image.slim`, which contains:

{% gist 6860333 %}

When you're ready, you run `reveal-ck` like so:

```
reveal-ck generate --file google-slides.rb
```

Here are the [results][google-slides].

<img src="images/ck-logo-saw.svg" alt="RevealCK" style="float: right;" />

Scraping web? A remote API? A database?

If Ruby can do it, you can create slides from it.

## Ready to make some slides?

It begins with `gem install reveal-ck`, and then you're off and
running.

This is the project home page.

You can find source code and instructions at
[github/jedcn/reveal-ck][reveal-ck].

There are [Getting Started][reveal-ck-getting-started] pages.

And, finally, there is a wordier
[post about reveal-ck][jedcn-reveal-ck].

## Happy Sliding!

[basic-configured-slides]: http://jedcn.github.io/reveal-ck-example/basic-configured-slides
[basic-slides]: http://jedcn.github.io/reveal-ck-example/basic-slides
[google-slides]: http://jedcn.github.io/reveal-ck-example/google-slides
[haml]: http://haml.info/
[inline-slides]: http://jedcn.github.io/reveal-ck-example/inline-slides
[jedcn-reveal-ck]: http://jedcn.com/posts/reveal-ck/
[reveal-ck-getting-started]: https://github.com/jedcn/reveal-ck/blob/master/doc/getting_started.md
[reveal-ck-intro-template]: https://github.com/jedcn/reveal-ck/blob/master/templates/intro.slim
[reveal-ck]: https://github.com/jedcn/reveal-ck
[reveal-js-themes]: http://lab.hakim.se/reveal-js/#/themes
[reveal-js-transitions]: http://lab.hakim.se/reveal-js/#/transitions
[reveal-js]: http://lab.hakim.se/reveal-js/#/
[slim]: http://slim-lang.com/
