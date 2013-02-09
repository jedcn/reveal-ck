Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

  Scenario: Generating basic slides
    Given a file named "slides.haml" with:
    """
    %section
      %h1
        Made with RevealCK
      %p.small
        oh yeah!
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides.html       |
    | slides/index.html |
    And the file "slides.html" should contain exactly:
    """
    <section>
      <h1>
        Made with RevealCK
      </h1>
      <p class='small'>
        oh yeah!
      </p>
    </section>

    """
    And the file "slides/index.html" should contain:
    """
    <section>
      <h1>
        Made with RevealCK
      </h1>
      <p class='small'>
        oh yeah!
      </p>
    </section>
    """
