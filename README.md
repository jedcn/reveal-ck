# Create Slides with Markdown

[![Gem Version](https://badge.fury.io/rb/reveal-ck.svg)](http://badge.fury.io/rb/reveal-ck)

reveal-ck helps you author [reveal.js][reveal.js] presentations.

You can create slides in numerous languages, but the most popular is
Markdown. And not just any markdown-- it's markdown like you write on
https://github.com, so it supports:

* emoji (:money_with_wings:)
* automatic links (https://github.com)
* @mentions (@jedcn)
* GFM tables

## How do I get started?

* Install [the reveal-ck gem][reveal-ck-gem]
* Copy and paste the following, and save it in a file named
  `slides.md`:
```
## i :heart: reveal.js
---
## This is your
* presentation
* content
* in a single file
---
## Slides are Separated with `---`
---
## Vertical Sections..
Start and End with `***`
***
These
---
Slides
---
Are
---
Vertical!!
***
## :zap: LiveReload is builtin :zap:
with `reveal-ck serve`
---
## :metal: emoji comes standard :money_with_wings:
---
## What's up with the "-ck"?
It stands for construction kit.
---
# So, if you're not
a fan of Markdown you can also use

1. html
2. erb
3. haml
4. slim
5. ruby (DSL)
---
## See also:
http://jedcn.github.io/reveal-ck/
---
## Might be helpful:
https://relishapp.com/jedcn/reveal-ck/
## Questions? Problems?
Let me know, @jedcn
---
# Thanks!
```
* Open a terminal and change to the directory with your new
  `slides.md`
* Run `reveal-ck generate` followed by `reveal-ck serve`. You should
  see:
```
$ reveal-ck generate
Generating slides for 'slides.md'..
$ reveal-ck serve
------------------------------------------------------------
[ reveal-ck ] Serving up slide content in 'slides/'.
[ reveal-ck ] Open your browser to 'http://localhost:10000'.
[ reveal-ck ] Press CTRL-C to stop.
------------------------------------------------------------
[ reveal-ck ] Getting Ready to Reload Browsers.
[   reload  ] Using Guardfile at ...
[   reload  ] LiveReload is waiting for a browser to connect.
[   reload  ] Guard is now watching at 'whereever'
[ reveal-ck ] Getting Ready to Rebuild Slides.
[ reveal-ck ] Starting Webserver.
```

Now view the slide deck generated from this single file by opening
your browser to [http://localhost:10000][localhost].

Check back at the terminal where the serve command is running and see
that reveal-ck is aware that you're viewing your slides:

```
[   reload  ] Browser connected.
```

## And then?

Use your editor and make a change to the `slides.md` file.

reveal-ck will see the change, rebuild your slides, and reload your
browser for you.

As a final step *for now*, create a file named `config.yml` alongside
the `slides.md` and add a single line:

```
theme: night
```

And your slides will take on the night theme from reveal.js.

---

## What is it like?

Here's a quick example of what it's like to work with reveal-ck:

* Normally you'd use a text editor, but for brevity, this example
  creates a file named `slides.md` with the `echo` command.
* A presentation is then generated with `reveal-ck generate`.
* That presentation is viewed with `open slides/index.html`. You'd
  normally run a `reveal-ck serve` and then view
  [https://localhost:10000][localhost]
* Next, a theme is introduced by supplying a `config.yml` file.
* That theme comes into play when the same presentation is generated
  again.
* Finally, the presentation is viewed again with `open slides/index.html`

![Fast Introduction](https://jedcn.github.io/reveal-ck/images/reveal-ck-fast-intro.gif)

---

## Where does this leave us?

* reveal-ck helps you build reveal.js presentations
* your content is stored in a single file so you can easily track it
  (**with git**) and review it (**with your brain**)
* write in markdown or the html-ish language of your choice

If find these ideas intriguing, you can learn more at
http://jedcn.github.io/reveal-ck/.

## Contributing

If you'd like to log a bug, propose an issue, or get going with local
development, please see [doc/CONTRIBUTING.md](doc/CONTRIBUTING.md).

## Questions?

If you have questions, find me on github ([@jedcn][github-jedcn]) or
twitter ([@jedcn][twitter-jedcn]), open an issue, or email me at
revealck@jedcn.com.

[![Build Status](https://travis-ci.org/jedcn/reveal-ck.svg)](https://travis-ci.org/jedcn/reveal-ck)
[![Code Climate](https://codeclimate.com/github/jedcn/reveal-ck.png)](https://codeclimate.com/github/jedcn/reveal-ck)

[reveal.js]:     http://lab.hakim.se/reveal-js
[github-jedcn]:  https://github.com/jedcn
[twitter-jedcn]: https://twitter.com/jedcn
[reveal-ck-gem]: https://rubygems.org/gems/reveal-ck
[localhost]:     http://localhost:10000
[github-pages]:  https://pages.github.com/
