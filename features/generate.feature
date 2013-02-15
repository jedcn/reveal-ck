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
    And the output should contain exactly ""
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the following files should not exist:
    | slides.html |
    And the file "slides/slides.html" should contain exactly:
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

  Scenario: Generating slides with images
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
      <img alt='Ruby Logo' src='images/ruby100.png' />
    </section>
    """
