Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

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
    And the file "slides/index.html" should contain:
    """
    <section>
      <h1>Things That Go</h1>
    """
    And the file "slides/index.html" should contain:
    """
      <h3>...Bump In The Night</h3>
    </section>
    """
