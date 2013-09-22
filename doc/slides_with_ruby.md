## Creating Slides with Ruby

reveal-ck gives you the opportunity to author slides in ruby. The
project comes with a small number of
[pre-built templates][reveal-ck-template-list] that encapsulate
reveal.js tag names, attributes, and classes aside.

reveal-ck also provides classes that enable you to create slides
programmatically as well as a DSL style approach that obscures those
classes.

### Programmatically

### Using a DSL

Here's an example of the DSL:

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

[reveal-ck-template-list]: https://github.com/jedcn/reveal-ck/blob/master/doc/template_list.md
