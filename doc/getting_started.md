## Getting Started

The first step in making a new set of slides is picking whether or not
you want to author them in slim, haml, or ruby.

### Slim and Haml

Slim and Haml are both templating languages, and the approach you use
to build slides is similar between the two. If you go down this path,
you should pick whichever templating framework you are more familiar
with, and then start looking through examples of markup to copy and
customize in [reveal-ck-template][github-jedcn-reveal-ck-template] or
[reveal.js][reveal-js] itself.

[Here's a page dedicated to creating slides in Slim][reveal-ck-slides-with-slim].

[Here's a page dedicated to creating slides in Haml][reveal-ck-slides-with-haml].

### Ruby

Authoring slides in ruby is slightly different. You can build a list
of slides up programmatically or you can use a DSL. When working in
Ruby there is a slight separation between bare Ruby objects and the
templates that produce the slide markup.

This separation means that reveal-ck can provide "built-in templates"
which produce markup and look good while abstracting away the details
of how the markup works.

[Here's a page dedicated to creating slides in Ruby][reveal-ck-slides-with-ruby].

[github-jedcn-reveal-ck-template]: http://github.com/jedcn/reveal-ck-template
[reveal-js]: http://lab.hakim.se/reveal-js
[reveal-ck-slides-with-haml]: https://github.com/jedcn/reveal-ck/blob/master/doc/slides_with_haml.md
[reveal-ck-slides-with-slim]: https://github.com/jedcn/reveal-ck/blob/master/doc/slides_with_slim.md
[reveal-ck-slides-with-ruby]: https://github.com/jedcn/reveal-ck/blob/master/doc/slides_with_ruby.md
