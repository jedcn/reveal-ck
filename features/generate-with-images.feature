Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

  Scenario: Generating slides that reference my images
    Given a file named "images/ruby100.png" that's a copy of "data/images/ruby100.png"
    And a file named "slides.haml" with:
    """
    %section
      %img{ alt: 'Ruby Logo', src: 'images/ruby100.png' }
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/slides.html        |
    | slides/index.html         |
    | slides/images/ruby100.png |
    And the file "slides/index.html" should contain:
    """
    <section>
      <img alt='Ruby Logo' src='images/ruby100.png'>
    </section>
    """
