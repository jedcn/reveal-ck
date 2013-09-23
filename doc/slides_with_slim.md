## Creating Slides with Slim

Regardless of which template language you are working in, each slide
is based on a `<section/>`.

Here is a simple example:

```haml
section
  h1 Hello World
  h3 ..in Slim
```

Save this out to a single file that is named `slides.slim` and then
run `reveal-ck generate`. The command line tool will create a new
directory named `slides/` and build up a presentation at
`slides/index.html`.

The content of your `slides.slim` has been transformed from slim into
html and now lives at `slides/slides.html`. Next, this content is
spliced into a reveal.js presentation at `slides/index.html`.

If you are on MacOS, you can type: `open slides/index.html` to see you
presentation.

You can also type: `reveal-ck generate && open slides/index.html` to
generate your slides and preview them.

### Resources

I went through each of the slides in reveal.js and converted to an
[equivalent version in slim][reveal-ck-template-slides-slim], and I
hope you find it useful.

The main references I use are:

* [The main Slim site][slim]
* [The Slim reference][slim-reference]

[reveal-ck-template-slides-slim]: https://github.com/jedcn/reveal-ck-template/blob/master/slides.slim
[slim]: http://slim-lang.com/
[slim-reference]: http://rdoc.info/gems/slim/frames
