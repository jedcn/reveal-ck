---
layout: child
title: HTML Reference
---

# Slides with Html

You can create slides using Html.

Start by creating a file named `slides.html` and then remember these
three ideas:

1. Per reveal.js, slides are separated with `<section/>` tags.
2. Most standard Html tags do what you suspect.
3. You'll spend your time most efficiently if you study the *data
   attributes* and *classes* that are used in the
   [reveal.js demo][reveal-demo].

While the [reveal.js demo][reveal-demo] is your ultimate reference,
I've documented a few snippets that are commonly used below.

[reveal-demo]: http://lab.hakim.se/reveal-js/#/

## Separating Slides

Slides are separated with `<section/>`s.

Here are two slides:

<pre>
  <code class="markdown">
&lt;section&gt;
  &lt;h1&gt;Slide 1&lt;/h1&gt;
&lt;/section&gt;

&lt;section&gt;
  &lt;h1&gt;Slide 2&lt;/h1&gt;
&lt;/section&gt;
  </code>
</pre>

## Speaker Notes

Speaker notes are visible only to you, and they are added with an
`<aside>` that has a `class="notes"`.

Here is a slide with a speaker note:

<pre>
  <code class="markdown">
&lt;section&gt;
  &lt;h1&gt;Slide 1&lt;/h1&gt;
  &lt;aside class="notes"&gt;
    Remember to mention that..
  &lt;/aside&gt;
&lt;/section&gt;
  </code>
</pre>

## Background Colors

You can change the background color of a slide by providing a data
attribute named `data-background`. The value of this data attribute is
any valid CSS color format:

<pre>
  <code class="markdown">
&lt;section data-background="#007777"&gt;
  &lt;h1&gt;Slide 1&lt;/h1&gt;
&lt;/section&gt;
  </code>
</pre>

## Background Images

You can set an image as the background of a slide by providing the
same data attribute that you did for the background color. However,
the value of this data attribute should be a URL where an image can be
found.

The URL can be absolute, like this one:

<pre>
  <code class="markdown">
&lt;section data-background="https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg"&gt;
  &lt;h1&gt;Slide 1&lt;/h1&gt;
&lt;/section&gt;
  </code>
</pre>

Or you can download an image directly, save it to the `images/`
directory, and then reference it relatively like this:

<pre>
  <code class="markdown">
&lt;section data-background="images/reveal-parallax-1.jpg"&gt;
  &lt;h1&gt;Slide 1&lt;/h1&gt;
&lt;/section&gt;
  </code>
</pre>
