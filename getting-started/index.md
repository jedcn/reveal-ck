---
layout: bare
title: Getting Started
---

# Getting Started

[reveal-ck is a ruby gem][reveal-ck-gem].

To get going, you install the gem, create some slides, and then run
`reveal-ck` from the command line.

Let's go through those steps one by one.

## Installation

To get going, you need a relatively modern ruby (1.9 or 2.0).

Once you've got that, reveal-ck installs as a standard gem:

```
gem install reveal-ck
```

## First Presentation

Once the gem is installed, create a new file named `slides.haml` and
put the following into it:

{% highlight haml %}
%section
  %h1
    Slides
  %h3
    with Ruby?
%section
  %h1
    Awesome!
{% endhighlight %}

By default, reveal-ck looks for files named `slides.haml` or
`slides.slim` or `slides.rb`. In this case, we've used Haml.

The haml specifies HTML that looks, roughly, like:

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

## Generating Slides

Once you've saved that content, run the following command:

```
reveal-ck generate
```

This command will transform the Haml into HTML and then integrate that
HTML into a stock reveal.js presentation. It builds out the result in
the `slides/` directory.

To see what was created just now, open `slides/index.html` in a
browser. If you're on MacOS you can type: `open slides/index.html`.

# What Next?

This first step created a presentation in Haml. If you're good with
haml, then [check out more information about haml][haml].

If you'd like to switch to slim, then
[check out more information about slim][slim].

If you'd like to learn about creating slides with ruby,
[check out more information about ruby][ruby].


[reveal.js]:     http://lab.hakim.se/reveal-js/#/
[reveal-ck-gem]: http://rubygems.org/gems/reveal-ck
[haml]:          /haml
[ruby]:          /ruby
[slim]:          /slim
