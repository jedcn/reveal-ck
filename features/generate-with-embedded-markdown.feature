Feature: Using the :markdown filter within haml

  If you're authoring slides in haml you can activate the markdown
  filter and markdown.

  Scenario: Generating slides with embedded markdown
    Given a file named "slides.haml" with:
    """
    %section
      :markdown
        # Things That Go
        ### ...Bump In The Night
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1[text()="Things That Go"]       | the h1 |
    | //section/h3[text()="...Bump In The Night"] | the h3 |
