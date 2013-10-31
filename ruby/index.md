---
layout: child
title: Slides with Ruby
---

# Slides with Ruby

Slim and Haml are great, but what about writing slides in Ruby?

When using reveal-ck with ruby slides, it's most straight forward to
create a file named `slides.rb` into which you put your Ruby
content. This file will automatically be taken into account when you
run `reveal-ck generate` to generate slides.

Here are some core ideas to get you building individual slides:

* Introduction to Presentation DSL
* Concrete Example
* Variables and Slides
* Generating Slides
* Built-in Templates
* Displaying Code
* The Remainder of the Presentation DSL
* Referencing Images

## Introduction to Presentation DSL

A presentation with slides is represented by an internal DSL where a
single `presentation` accepts a block with one or more `slide`
invocations.

Here's a general (but not functional) example of a presentation with
three slides:

{% highlight ruby %}
presentation do
  # First Slide
  slide(...)

  # Second Slide
  slide(...)

  # Third Slide
  slide(...)
end
{% endhighlight %}

There are a few other methods that can be included in the DSL:

{% highlight ruby %}
presentation do

  author     = "..."
  title      = "..."
  theme      = "..."
  transition = "..."

  # First Slide
  slide(...)

end
{% endhighlight %}

`author`, `title`, `theme`, and `transition` all have reasonable
defaults. You can leave them out until you need them. These values are
normally defined in the main [config file][config], but if you're
building slides with Ruby you can place them right here.

## Concrete Example

To end up with a functional example with this DSL we need to tie each
`slide(...)` invocation together with a template.

Create a new file named `hello.haml` in the `templates/` directory.

`templates/hello.haml`:
{% highlight haml %}
%section
  %h1 Hello
{% endhighlight %}

Next, create a file named `slides.rb`.

`slides.rb`:
{% highlight ruby %}
presentation do
  slide('hello.haml')
end
{% endhighlight %}

The first argument to the slide invocation should be a string that
matches one of the files in your `templates/` directory.

You can also pass a string that begins with the template name:

{% highlight ruby %}
presentation do
  slide('hello')
end
{% endhighlight %}

In this case, reveal-ck looks for any file that matches
`templates/hello*`, and so it finds `templates/hello.haml`.

## Variables and Slides

Let's modify the example above slightly.

`templates/hello.haml`
{% highlight haml %}
%section
  %h1= "Hello #{name}"
{% endhighlight %}

Now, let's make the second argument to the slide invocation a hash
that contains keys for any variables used in the template:

`slides.rb`:
{% highlight ruby %}
presentation do
  slide('hello.haml', { name: "there" })
end
{% endhighlight %}

As you'd expect with a template, the variable `name` will be
substituted in and the template will produce:

{% highlight html %}
<section>
  <h1>Hello there</h1>
</section>
{% endhighlight %}

## Generating Slides

Building on the example above, we can leverage the fact that we're in
Ruby and invoke `slide()` programmatically:

`slides.rb`:
{% highlight ruby %}
presentation do
  ['there', 'again'].each do |name|
    slide('hello', { name: name })
  end
end
{% endhighlight %}

## Built-in Templates

reveal-ck comes with several built-in templates. These are available
for your use. They can't be modified, so it's expected that most users
will move on to build their own custom templates in the `templates/`
directory.

The list of available templates can be [browsed on github][templates].

Let's consider two examples: [intro.slim][intro.slim] and
[quote.slim][quote.slim].

`intro.slim` provides a template for the common "first slide" of
reveal.js presentations. You can see which variables are available for
substition (and whether these variables have defaults) by reading the
code.

`quote.slim` provides a template for a block quote.

Here's a presentation that uses both:

{% highlight ruby %}
presentation do

  slide('intro.slim', {
          title: "Wonderful",
          subtitle: "Slides",
          author: "Jed Northridge",
          link: "http://jedcn.com",
          twitter: "jedcn",
          notes: "Okay! Here we go.."
        })

  slide('quote.slim', {
          headline: "Alan Perlis",
          content: "A language that doesn't affect the way you think about programming, is not worth knowing.",
          citation: 'http://en.wikiquote.org/wiki/Alan_Perlis'
        })

end
{% endhighlight %}

What's going on here?

* At present, you need to read the source of the templates to
  understand the significance (and existence) of the variables.

* `intro.slim` attempts to capture the style of the "first slide" that
  begin many reveal.js presentations.

* In general, the built-in templates attempt to make all keys optional
  and have sensible defaults if the key isn't present.

* `quote.slim` and the other templates follow a convention:

 * The `content` key in the hash represents the core content in the
   slide. For example, it serves as the quote in `quote.slim` and the
   code in `code.slim`.

 * The `headline` is optional, and appears as an `<h2/>` because this
   is a common style in reveal.js slides.

* All slides follow the convention that the `notes` key in the hash
  will appear as notes when in speaker mode.

It's an internal DSL, so any valid ruby language tricks can be
applied:

{% highlight ruby %}
presentation do

  slide 'intro',
        title:    'Wonderful',
        subtitle: 'Slides',
        author:   'Jed Northridge',
        link:     'http://jedcn.com',
        twitter:  'jedcn',
        notes:    'Okay! Here we go..'

  slide 'quote'
        headline: 'Alan Perlis',
        content:  "A language that doesn't affect the way you think about programming, is not worth knowing.",
        citation: 'http://en.wikiquote.org/wiki/Alan_Perlis'

end
{% endhighlight %}

## Displaying Code

To display code, create your own template, in either slim or haml,
that follows the conventions for showing code.

Alternatively, you can use the built-in template
[code.slim][code.slim]:

{% highlight ruby %}
presentation do

  slide('code.slim', {
          content: contents_of('slides.rb'),
          notes: "Huh? Is this a.. slide quine?"
        })

end
{% endhighlight %}

Whether you use your own template or the built-in one, please be aware
that the `contents_of` function is available to you. This function
expects a path to a file and returns the contents of that file.

In the case above, we're using `contents_of` to include the content of
the slides into the slides.

## The Remainder of the Presentation DSL

You can also invoke these methods:

{% highlight ruby %}
presentation do

  author     = "Your Name"
  title      = "Your Title"
  theme      = "night"
  transition = "page"

  # First Slide
  slide(...)

end
{% endhighlight %}

They act like their counterparts in the [config file][config].

## Referencing Images

Your slides will likely contain images. These images may already be
hosted on the internet somewhere (allowing them to be referenced
absolutely). However, if they are not, or you'd prefer to maintain a
local copy, then you should create a directory named `images/` and
put your images here.

The contents of the `images/` directory will be copied into the
generated presentation by reveal-ck. This means that if you had an
image named `cat.png` and you placed it into the `images/` directory,
you could reference its source as `images/cat.png`

[config]:         ../config
[reveal.js]:      http://lab.hakim.se/reveal-js/#/

[templates]: https://github.com/jedcn/reveal-ck/tree/master/templates
[intro.slim]: https://github.com/jedcn/reveal-ck/blob/master/templates/intro.slim
[quote.slim]: https://github.com/jedcn/reveal-ck/blob/master/templates/quote.slim
[code.slim]: https://github.com/jedcn/reveal-ck/blob/master/templates/code.slim
