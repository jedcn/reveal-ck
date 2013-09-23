## Custom Templates

reveal-ck comes with several built-in templates. These are provided to
be helpful to people new to reveal-ck, and used when people are
building slides with Ruby.

However, once you have been making slides for a bit, you will want to
provide your own templates.

The built-in templates are stored within the gem, and you can see them
by browsing through the [templates/][reveal-ck-templates]
directory. These can serve as reasonable examples when you start
building your own templates.

### Getting Started

To author your own templates, create your own `templates/` directory
underneath your `slides.rb`. Next, create a new file in that
`template/` directory. For example, if you want to create a template
for a youtube slide in Slim, you might create a file named
`youtube.slim` with the following content:

```slim
section
  iframe (width="560" height="315" src="http://www.youtube.com/embed/#{video}" frameborder="0" allowfullscreen)
```

This template requires that a variable named `video` be supplied.

Once this file has been created, you can create a Slide in your
`slides.rb` like so:

```ruby
slide 'youtube', video: 'kWBhP0EQ1lA'
```

Or programmatically:

```ruby
RevealCK::Slide.new('youtube', { video: 'kWBhP0EQ1lA' }
```

### Template Lookup

Whenever you create a new `RevealCK::Slide` you supply a `String` as a
first argument, and this string is expected to match the name of a
template file. This means that `Slide.new('youtube')` could match
`youtube.slim` or `youtube.haml` or `youtube-hump-day.slim`. File
globbing is involved, and it is like looking for `youtube*`.

There are three locations that are checked when resolving the
glob. They are, in order:

1. The current directory
2. A directory named `templates/` underneath the current directory
3. The `templates/` directory up in the gem.

This means that if reveal-ck has a built-in template named
`code.slim`, but you prefer your own, then you can create a
`code.slim` or a `code.haml` in your `templates/` directory and your
slide will take precedence.

[reveal-ck-templates]: https://github.com/jedcn/reveal-ck/tree/master/templates
