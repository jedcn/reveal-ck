## Template List

reveal-ck comes with several built-in templates. These are used when
you are building slides with Ruby. The file names of these templates
can be provided when creating a new slide in the DSL:

```
  slide 'text', content: 'Hello World'
```

Or programmatically in ruby:

```
RevealCK::Slide.new('text', content: 'Hello World')
```

The built-in templates that are included can be find in
[templates/][reveal-ck-templates].

You can get an idea for what they do and what variables they expect by
browsing through them.

One goal of the built-in slides is to consistently support certain
variables, like `headline` or `notes`.

[reveal-ck-templates]: https://github.com/jedcn/reveal-ck/tree/master/templates
