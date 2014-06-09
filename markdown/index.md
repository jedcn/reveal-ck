---
layout: child
title: Slides with Markdown
---

# Slides with Markdown

<p class="lead">
Making slides in Markdown is the fastest and most accessible way to
get going with reveal-ck.
</p>

If you're looking to become more comfortable with Markdown, here's the
official [markdown reference][markdown-reference].

If you're already comfortable with markdown, the main thing to know is
this:

<blockquote>
You can use all of the standard markdown conventions with the
exception of <code>---</code>. This is normally reserved for inserting
a horizontal rule. When using reveal-ck, it's used to separate slides.
</blockquote>

You can start creating slides by putting your markdown content into a
file named `slides.md`.

Here are some core ideas to get you building individual slides:

* `---` separates slides
* Titles and Subtitles
* Displaying Code
* Referencing Images

If you'd like to change the theme or transition styles (for all of
your slides), see the [config information][config].

## `---` separates slides

<p class="lead">
Here are three slides:
</p>

```
  1

---

  2

---

  3
```

## Titles and Subtitles

<p class="lead">
<code>&lt;h1&gt;</code>/<code>&lt;h3&gt;</code> serve as good
title/subtitle combinations.
</p>

```
# Title

### Subtitle
```

## Speaker Notes

Add `<aside class="notes">` within a slide to get notes (only in
speaker mode) for that slide.

```
# Slide 1

<aside class="notes">
  Notes for first slide.
</aside>

---

# Slide 2

<aside class="notes">
  Notes for second slide.
</aside>
```

## Vertical Slides

<p class="lead">
Vertical Slides aren't supported when using Markdown.
</p>

Markdown is great to get started with, but it doesn't offer the fine
grained control that's needed for this feature.

## Revealing Content

<p class="lead">
Reveal content isn't supported when using Markdown.
</p>

Markdown is great to get started with, but it doesn't offer the fine
grained control that's needed for this feature.

## Displaying Code

<p class="lead">
You can put code into slides using standard markdown conventions:
</p>

You can choose to use 4 spaces:

```
    def adder(a, b)
      a + b
    end
```

Or use a triple fence block:

<pre>
```
def adder(a, b)
  a + b
end
```
</pre>

## Referencing Images

<p class="lead">
It's easy to include images into your slides.
</p>

Your slides will likely contain images. These images may already be
hosted on the internet somewhere (allowing them to be referenced
absolutely). However, if they are not, or you'd prefer to maintain a
local copy, then you should create a directory named `images/` and put
your images here.

The contents of the `images/` directory will be copied into the
generated presentation by reveal-ck. This means that if you had an
image named `cat.png` and you placed it into the `images/` directory,
you could reference it as follows in your slides:

```
![My Wonderful Cat](images/cat.png)
```

[config]:                      ../config
[haml]:                        http://haml.info/
[markdown-reference]:          http://daringfireball.net/projects/markdown/syntax
[reveal.js]:                   http://lab.hakim.se/reveal-js/#/
[reveal-js-fragmented-views]:  http://lab.hakim.se/reveal-js/#/fragments
[reveal-js-fragmented-styles]: http://lab.hakim.se/reveal-js/#/19/1
