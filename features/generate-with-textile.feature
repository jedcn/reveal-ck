Feature: Slides with textile

  reveal-ck can create a presentation using [textile][redcloth].

  You should create a file named `slides.textile` where each slide is
  contained with a `<section>`. Then run `reveal-ck generate`.

  Your slides will be available at `slides/index.html`.

  If you'd like to see the intermediate file where your
  `slides.textile` is transformed into `.html` you can visit
  `slides/slides.html`

  [redcloth]: http://redcloth.org/

  Scenario: Generating basic slides using textile
    Given a file named "slides.textile" with:
    """
    <section>

    h1. Reveal.js

    h3. HTML Presentations Made Easy

    </section>

    <section>

    h1. THE END

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
