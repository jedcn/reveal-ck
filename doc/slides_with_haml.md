## Creating Slides with Haml

Regardless of which template language you are working in, each slide
is based on a `<section/>`.

Here is a simple example:

```haml
section
  %h1
    Hello World
  %h3
    ..in Haml
```

Save this out to a single file that is named `slides.haml` and then
run `reveal-ck generate`. The command line tool will create a new
directory named `slides/` and build up a presentation at
`slides/index.html`.

The content of your `slides.haml` has been transformed from haml into
html and now lives at `slides/slides.html`. Next, this content is
spliced into a reveal.js presentation at `slides/index.html`.

If you are on MacOS, you can type: `open slides/index.html` to see you
presentation.

You can also type: `reveal-ck generate && open slides/index.html` to
generate your slides and preview them.

### Resources

I use the following whenever I get involved with HAML:

* [The main Haml site][haml]
* [The Haml reference][haml-reference]

[haml]: http://haml.info/
[haml-reference]: http://haml.info/docs/yardoc/file.REFERENCE.html
