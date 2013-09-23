## Creating Slides with Ruby

reveal-ck gives you the opportunity to author slides in ruby. The
project comes with a small number of
[pre-built templates][reveal-ck-template-list] that encapsulate
reveal.js tag names, attributes, and classes aside.

reveal-ck also provides classes that enable you to create slides
programmatically as well as a DSL style approach that obscures those
classes.

### Using a DSL

The DSL has two core methods, `presentation` and `slide`.

Here is a simple example:

```ruby
presentation do
  slide 'text', content: 'Hello World.. in Ruby'
end
```

Save this out to a single file that is named `slides.rb` and then run
`reveal-ck generate`. The command line tool will create a new
directory named `slides/` and build up a presentation at
`slides/index.html`.

The content of your `slides.rb` has been transformed from ruby into
html and now lives at `slides/slides.html`. Next, this content is
spliced into a reveal.js presentation at `slides/index.html`.

If you are on MacOS, you can type: `open slides/index.html` to see you
presentation.

You can also type: `reveal-ck generate && open slides/index.html` to
generate your slides and preview them.

#### Another Example

Here's another example of using the DSL. Each `slide` invocation
creates a new slide. As you can see at the end with the `.each`, when
you are working in ruby, you can create content dynamically:

```ruby
presentation do
  slide 'title',
        title: 'Here we go!',
        author: 'Jed Northridge'

  slide 'quote',
        content: "when you don't create things, you become defined by your tastes rather than ability. your tastes only narrow & exclude people. so create."

  ['3', '2', '1', 'Contact!'].each do |s|
    slide 'text', content: s
  end
end
```

### Programmatically

You can also build up ruby objects in a regular ruby program and avoid
using the command line.

There is an example in [examples/programmatic-slides.rb][programmatic-slides].

[programmatic-slides]: https://github.com/jedcn/reveal-ck/blob/master/examples/programmatic-slides.rb
[reveal-ck-template-list]: https://github.com/jedcn/reveal-ck/blob/master/doc/template_list.md
