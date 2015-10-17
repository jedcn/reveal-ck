# Quick Example

## Creating Slides. Supplying Configuration.

In this animated gif a presentation with a single slide is created.

Next, a configuration file is created that changes the theme and the
slides are rebuilt.

![Fast Introduction](https://jedcn.github.io/reveal-ck/images/reveal-ck-fast-intro.gif)

### What's happening here?

* Normally you'd use a text editor for creating slides, but here we
  use the `echo` command.
* A presentation is then generated with `reveal-ck generate`.
* That presentation is viewed with `open slides/index.html`.
* Then a theme is introduced by supplying a `config.yml` file.
* That theme takes effect when the same presentation is generated
  again.

### File Details

It goes by quick-- so-- here's the content in the slides file named
`slides.md`:

```markdown
i :heart: reveal.js
```

And here's what goes into the configuration file named `config.yml`:

```yml
theme: night
```

## Automatic Slide Regeneration + Browser Refresh

The command `reveal-ck generate` generates a slide presentation. It's
a one time thing: it runs, it finishes, and it's done:

```bash
$ reveal-ck generate
Generating slides for 'slides.md'..
```

However, the command `reveal-ck serve` starts up a webserver and
waits. It watches the file system for when you change your slides
file, and it automatically refreshes your web browser (so you don't
have to hit RELOAD):

```
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

[localhost]: http://localhost:10000

Check back at the terminal where the serve command is running and see
that reveal-ck is aware that you're viewing your slides:

```
[   reload  ] Browser connected.
```

Now, use your editor and change the `slides.md` file.

reveal-ck will see the change, rebuild your slides, and reload your
browser for you.
