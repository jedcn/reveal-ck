Feature: Slides with markdown

  reveal-ck can create a presentation using [kramdown][kramdown].

  You should create a file named `slides.kramdown`.

  Unlike using the standard markdown, you do not separate slides with
  `---`.

  Instead, you use kramdown as a regular templating languages-- it's
  your responsibility to create `<section>`s manually.

  [kramdown]: https://github.com/gettalong/kramdown

  Scenario: Generating basic slides with slides.kramdown
    Given a file named "slides.kramdown" with:
    """
    * one
    * two
    * {:.fragment} three
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
      | //li[contains(@class, fragment)] | an li with a class of fragment |
    And the file "slides/index.html" should have html matching the xpath:
      | //li[contains(@class, fragment)] | an li with a class of fragment |

  Scenario: Generating basic slides with slides.kramdown
    Given a file named "slides.kramdown" with:
    """
    <section>
    * one
    * two
    * {:.fragment} three
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
      | //li[contains(@class, fragment)] | an li with a class of fragment |
    And the file "slides/index.html" should have html matching the xpath:
      | //li[contains(@class, fragment)] | an li with a class of fragment |
