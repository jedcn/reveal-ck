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
    </section>
    <section>
      <h1>THE END</h1>
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1[contains(., "Reveal.js")]                    | the opening h1 |
    | //section/h3[contains(., "HTML Presentations Made Easy")] | the opening h3 |
    | //section/h1[contains(., "THE END")]                      | the closing h1 |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1[contains(., "Reveal.js")]                    | the opening h1 |
    | //section/h3[contains(., "HTML Presentations Made Easy")] | the opening h3 |
    | //section/h1[contains(., "THE END")]                      | the closing h1 |
