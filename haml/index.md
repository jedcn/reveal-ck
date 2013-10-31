---
layout: child
title: Slides with Haml
---

# Slides with Haml

Making slides in Haml works best when you have a decent understanding
of both Haml and some of the conventions that reveal.js follows.

If you're looking to become more comfortable with haml, here's
[the main haml][haml] site and the official
[haml reference][haml-reference].

When working with haml, it's most straight forward to create a file
named `slides.haml` into which you put your Haml content. This file
will automatically be taken into account when you run `reveal-ck
generate` to generate slides.

As far as reveal.js conventions go, the best thing to do is look
through Hakim's official [reveal.js slides][reveal.js] and do 'View
Source' in your browser whenever you see something that you like.

Here are some core ideas to get you building individual slides:

* Sections represent slides
* Titles and subtitles
* Speaker Notes
* Vertical Slides
* Revealing Content
* Displaying Code
* Referencing Images

If you'd like to change the theme or transition styles (for all of
your slides), see the [config information][config].

## Sections represent slides

Here are three slides:

{% highlight haml %}
%section
  1
%section
  2
%section
  3
{% endhighlight %}

## Titles and subtitles

`<h1>`/`<h3>` serve as good title/subtitle combinations.

{% highlight haml %}
%section
  %h1
    Title
  %h3
    Subtitle
{% endhighlight %}

## Speaker Notes

Add `<aside class="notes">` underneath a `<section>` to get notes
(only in speaker mode) for that slide.

{% highlight haml %}
%section
  %p
    Slide 1
  %aside.notes
     Notes for first slide.

%section
  %p
    Slide 2
  %aside.notes
     Notes for second slide.
{% endhighlight %}

## Vertical Slides

Create a parent `<section>` that has two or more `<section>` children.

{% highlight haml %}
%section
  %section
    %p
      Vertical Slide 1

  %section
    %p
      Vertical Slide 2
{% endhighlight %}

## Revealing Content

You can progressively reveal parts of your slide. Mark the parts that
should be revealed with a `class="fragment"`, as follows:

{% highlight haml %}
%section
  %section
    %p
      Happy
    %p.fragment
      Hacking!
{% endhighlight %}

You can make things grow and shrink:

{% highlight haml %}
%section
  %section
    %p.fragment.grow
      Happy
    %p.fragment.shrink
      Hacking!
{% endhighlight %}

In addition to revealing, growing, and shrinking, you can change
colors, roll in, etc. If you're interested in this stuff, the best way
to proceed here is to 'View Source' on Hakim's slides. Look for titles
like 'Fragmented Views' and 'Fragment Slides'. Last I checked, they
were [here][reveal-js-fragmented-views] and
[here][reveal-js-fragmented-styles].

## Displaying Code

Create a `<pre>` that has a `<code>` child, then add the preserve
filter and place your code underneath.

{% highlight haml %}
%section
  %pre
    %code
      :preserve
        def adder(a, b)
          a + b
        end
{% endhighlight %}

Alternatively, you can use the `contents_of` helper. This allows you
to place your code into a file and inline the file contents. For
example, if you put code into a file named `adder.rb` and saved this
into a directory named `code/`, then you could inline it as follows:

{% highlight haml %}
%section
  %pre
    %code= contents_of('code/adder.rb')
{% endhighlight %}

## Referencing Images

Your slides will likely contain images. These images may already be
hosted on the internet somewhere (allowing them to be referenced
absolutely). However, if they are not, or you'd prefer to maintain a
local copy, then you should create a directory named `images/` and
put your images here.

The contents of the `images/` directory will be copied into the
generated presentation by reveal-ck. This means that if you had an
image named `cat.png` and you placed it into the `images/` directory,
you could reference it as follows in your slides:

{% highlight haml %}
%section
  %img{ src: 'images/cat.png' }
{% endhighlight %}

[config]:         ../config
[haml]:           http://haml.info/
[haml-reference]: http://haml.info/docs/yardoc/file.REFERENCE.html
[reveal.js]:      http://lab.hakim.se/reveal-js/#/

[reveal-js-fragmented-views]:  http://lab.hakim.se/reveal-js/#/fragments
[reveal-js-fragmented-styles]: http://lab.hakim.se/reveal-js/#/19/1
