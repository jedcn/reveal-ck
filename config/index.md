---
layout: child
title: Configuration
---

# Configuration

<p class="lead">
reveal-ck pays attention to a single, optional configuration file
named <code>config.yml</code>.
</p>

As an example, consider:

```
author:     "Jed Northridge"
title:      "My Presentation!"
theme:      "night"
transition: "page"
revealjs_config:
  autoSlide: 5000
  loop: true
```

## author

The value here, if any, will appear as a `<meta>` tag indicating
authorship in your slides.

## title

The value here, if any, will appear as the `<title>` of your slides.

## theme

The value here, if any, will control the theme of all slides in the
presentation. It must be one of the themes that's included with
reveal.js.

## transition

The value here, if any, will control the transition style of all
slides in the presentation. It must be one of the transitions that's
included with reveal.js.

## revealjs_config

This is a yaml key that points to a mapping of keys to values. Valid
key and value combinations are any
[reveal.js configuration][reveal.js-config] pair.

[reveal.js-config]: https://github.com/hakimel/reveal.js/#configuration
