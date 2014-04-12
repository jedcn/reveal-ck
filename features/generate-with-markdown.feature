Feature: Slides with markdown

  reveal-ck can create a presentation using [markdown][redcarpet].

  You should create a file named `slides.md` where each slide is
  separated by '---'. Then run `reveal-ck generate`.

  The '---' is used to separate slides rather than represent a
  `<hr/>`, and so it's not exactly markdown, but it's close.

  If you'd like to see the intermediate file where your `slides.md` is
  transformed into `.html` you can visit `slides/slides.html`

  [redcarpet]: https://github.com/vmg/redcarpet

  Scenario: Generating basic slides with slides.md
    Given a file named "slides.md" with:
    """
    # Reveal.js
    ### HTML Presentations Made Easy

    Created by [Hakim El Hattab][hakim]/[@hakimel][twitter]

    ---

    # THE END
    ### BY Hakim El Hattab / hakim.se

    [hakim]: http://hakim.se
    [twitter]: http://twitter.com/hakimel
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.md'..\n"
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <section>
    <h1>Reveal.js</h1>

    <h3>HTML Presentations Made Easy</h3>

    <p>Created by <a href="http://hakim.se">Hakim El Hattab</a>/<a href="http://twitter.com/hakimel">@hakimel</a></p>

    </section>
    <section>

    <h1>THE END</h1>

    <h3>BY Hakim El Hattab / hakim.se</h3>

    </section>
    """
    And the file "slides/index.html" should contain:
    """
    <section>
    <h1>Reveal.js</h1>

    <h3>HTML Presentations Made Easy</h3>

    <p>Created by <a href="http://hakim.se">Hakim El Hattab</a>/<a href="http://twitter.com/hakimel">@hakimel</a></p>

    </section>
    <section>

    <h1>THE END</h1>

    <h3>BY Hakim El Hattab / hakim.se</h3>

    </section>
    """
