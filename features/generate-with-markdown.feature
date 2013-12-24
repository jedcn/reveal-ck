Feature: Generate slides

  "reveal-ck generate" can create slides from "Slide Markdown." Slide
  Markdown is just like markdown with one important exception: any
  markdown that creates a Horizontal Rule instead marks the boundary
  between two slides.

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
    And the output should contain exactly ""
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
