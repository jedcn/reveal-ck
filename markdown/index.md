---
layout: child
title: Markdown Reference
---

# Slides with Markdown

You can create slides by following the rules of
[traditional markdown][daring-fireball-markdown].

reveal.js has good support for the various html headings, regular
text, ordered and unordered lists, and inline images.

[daring-fireball-markdown]: http://daringfireball.net/projects/markdown/syntax

Just create a file named `slides.md` and you should be off to the
races, but, there are two important things to know:

## Separating Slides

Slides are separated with `---`, and there's no support for easily
inserting the traditional horizontal rule.

Here are two slides:

<pre>
  <code class="markdown">
# Slide 1

---

# Slide 2
  </code>
</pre>

## Creating Speaker Notes

Speaker notes are created using the "fenced block" notation as
follows:

(You *must* use either `notes` or `note` right after the fence)

<pre>
  <code class="markdown">
# Slide 1

```notes
Notes for slide one.
```

---

# Slide 2

```note
A note for slide two.
```
  </code>
</pre>

Remember that you activate presentation mode by pressing `s` while
viewing your slides.

Also remember that slides must be served up from a web server in order
for speaker mode to work. You can run reveal-ck's built-in webserver
with `reveal-ck serve`.
