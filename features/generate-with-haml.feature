Feature: Slides with haml

  reveal-ck can create a presentation using [haml][haml-info].

  You should create a file named `slides.haml` where each slide is
  contained with a `%section`. Then run `reveal-ck generate`.

  Your slides will be available at `slides/index.html`.

  If you'd like to see the intermediate file where your `slides.haml`
  is transformed into `.html` you can visit `slides/slides.html`

  [haml-info]: http://haml.info/

  Scenario: Generating basic slides with slides.haml
    Given a file named "slides.haml" with:
    """
    %section
      %p
        Slides with Haml
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/p[contains(., "Slides with Haml")] | the p |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/p[contains(., "Slides with Haml")] | the p |
