Feature: Slides with slim

  reveal-ck can create a presentation using [slim][slim-lang].

  You should create a file named `slides.slim` where each slide is
  contained with a `section`. Then run `reveal-ck generate`.

  Your slides will be available at `slides/index.html`.

  If you'd like to see the intermediate file where your `slides.slim`
  is transformed into `.html` you can visit `slides/slides.html`

  [slim-lang]: http://slim-lang.com/

  Scenario: Generating basic slides with slides.slim
    Given a file named "slides.slim" with:
    """
    section
      p Slides with Slim
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/p[contains(., "Slides with Slim")] | the p |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/p[contains(., "Slides with Slim")] | the p |
