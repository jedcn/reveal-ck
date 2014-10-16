---
layout: child
title: Tutorial
---

# Tutorial

<p class="lead">
  Let's say you had reveal-ck installed and wanted to make some slides..
</p>

## Create a slides file

Begin by creating a file named `slides.md`.

Make it contain a title slide for your presentation:

<pre>
  <code class="markdown">
{% include tutorial-slide-1.md %}
  </code>
</pre>

## Separate Slides with ---

Use the triple-dash to separate content between your first slide and a
second slide:

<pre>
  <code class="markdown">
{% include tutorial-slide-1.md %}
---

{% include tutorial-slide-2.md %}
</code>
</pre>

## Add some Images

Recall how to do an "inline image" in Markdown, and then add two new
image slides:

<pre>
  <code class="markdown">
{% include tutorial-slide-1.md %}
---

{% include tutorial-slide-2.md %}
---

{% include tutorial-slide-3.md %}
---

{% include tutorial-slide-4.md %}
</code>
</pre>

### Please Note!

These images were created by Why the Lucky Stiff and are part of his
Poignant Guide to Ruby. The guide is available here:
[http://poignant.guide/][poignant-guide], and special thanks are in
order to [@mislav][mislav-poignant-guide] for taking care of this
resource.

[poignant-guide]: http://poignant.guide
[mislav-poignant-guide]: https://github.com/mislav/poignant-guide

## Generate a Presentation

Run the command `reveal-ck generate`.

Your slides will be created in the `slides/` directory, and
[here's a what you'd get][tutorial-slides-1].

<p class="lead">
  So far you've only written some Markdown, but you've just generated
  a full reveal.js presentation with Emoji and @mention support. Not
  bad!
</p>

[tutorial-slides-1]: ./slides/index.html

# Two Final changes

Let's explore two more changes that expose the spirit of reveal-ck.

## Speaker Note

Add a speaker note to the bottom of your `slides.md` as follows:

<pre>
  <code class="markdown">
{% include tutorial-slide-3.md %}
---

{% include tutorial-slide-4.md %}
{% include tutorial-notes.html %}
</code>
</pre>

## Theme Change

Create a file named `config.yml`:

<pre>
  <code class="yaml">
theme: "sky"
</code>
</pre>

With reveal-ck installed and these two files (`slides.md` and
`config.yml`), run the command `reveal-ck generate`.

Your presentation will be updated in the `slides/` directory, and
[here's what you would have][tutorial-slides-2].

Remember to see presentation mode by pressing `s` while you're viewing
the slides!

[tutorial-slides-2]: ./slides/index-with-theme.html

# Conclusion

<ol class="lead">
  <li>
    reveal.js is great.
  </li>
  <li>
    reveal-ck helps you build reveal.js presentations.
  </li>
  <li>
    reveal-ck encapsulates reveal.js details so that you remain
    focused on your content.
  </li>
  <li>
    You can write slides in Markdown, and this can help you get going
    quickly.
  </li>
  <li>
   You may be willing to learn more about reveal.js in exchange for
   fancier presentations. If that happens, reveal-ck is ready with
   support for html, erb, slim, haml, etc.
  </li>
</ol>
