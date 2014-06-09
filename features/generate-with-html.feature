Feature: Slides with HTML

  reveal-ck can create a presentation using HTML.

  You should create a file named `slides.html` where each slide is
  contained with a `<section>`. Then run `reveal-ck generate`.

  Your slides will be available at `slides/index.html`.

  Scenario: Generating basic slides using html
    Given a file named "slides.html" with:
    """
    <section>
      <h1>Reveal.js</h1>
      <h3>HTML Presentations Made Easy</h3>
      Created by <a href="http://hakim.se">Hakim El Hattab</a> / <a href="http://twitter.com/hakimel">twitter</a>
    </section>
    <section>
      <h1>THE END</h1>
      <h3>BY Hakim El Hattab / hakim.se</h3>
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.html'..\n"
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <section>
      <h1>Reveal.js</h1>
      <h3>HTML Presentations Made Easy</h3>
      Created by <a href="http://hakim.se">Hakim El Hattab</a> / <a href="http://twitter.com/hakimel">twitter</a>
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
      Created by <a href="http://hakim.se">Hakim El Hattab</a> / <a href="http://twitter.com/hakimel">twitter</a>
    </section>
    <section>
      <h1>THE END</h1>
      <h3>BY Hakim El Hattab / hakim.se</h3>
    </section>
    """
