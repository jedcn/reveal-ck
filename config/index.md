---
layout: child
title: Configuration
---

# Configuration

reveal-ck pays attention to a single, optional configuration file
named <code>config.yml</code>.

As an example, consider:

<pre>
  <code class="yml">
theme:      "night"
transition: "page"
author:     "Jed Northridge"
title:      "My Presentation!"
revealjs_config:
  autoSlide: 5000
  loop: true
  parallaxBackgroundImage: 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'
  parallaxBackgroundSize: '2100px 900px'
  </code>
</pre>

The values in this file take effect regardless of which technology
you're using to build your slides (Markdown, Html, Erb, Haml, Ruby,
etc).

## theme

The value here will control the theme of all slides in the
presentation. It must be one of the themes that's included with
reveal.js.

See the official [reveal.js themes][reveal.js-themes].

[reveal.js-themes]: http://lab.hakim.se/reveal-js/#/themes

## transition

The value here will control the transition style of all slides in the
presentation. It must be one of the transitions that's included with
reveal.js.

See the official [reveal.js transitions][reveal.js-transitions].

[reveal.js-transitions]: http://lab.hakim.se/reveal-js/#/transitions

## author

The value here will appear as a `<meta>` tag indicating authorship in
your slides.

## title

The value here will appear as the `<title>` of your slides.

## revealjs_config

This is a yaml key. It has children that are mappings of keys to
values.

Any key+value combination from the
[official reveal.js configuration documentation][reveal.js-config] is
supported.

[reveal.js-config]: https://github.com/hakimel/reveal.js/#configuration

In the example above, we see the following settings:

* autoSlide set to 5000 causes the slides to automatically advance
  every 5 seconds.
* loop set to true causes the slides to loop back to the beginning
  when they reach the end.
* parallaxBackgroundImage sets an image that serves as the backgrounds
  for all of the slides. It slowly moves across the screen as you
  progress.
* parallaxBackgroundSize is necessary if you use
  parallaxBackgroundImage.
