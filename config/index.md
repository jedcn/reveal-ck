---
layout: child
title: Configuration
---

# Configuration

reveal-ck pays attention to a single, optional configuration file
named `config.yml`.

As an example, consider:

```
author:     "Jed Northridge"
title:      "My Presentation!"
theme:      "night"
transition: "page"
```

## author

The value here, if any, will appear as a `<meta>` tag in your slides.

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
