Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

  Scenario: Generating slides without supplying a config
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
    And the file "slides/index.html" should contain:
    """
    <title>Slides</title>
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="author" content="Hakim El Hattab">
    """
    And the file "slides/index.html" should contain:
    """
    <link rel="stylesheet" href="css/theme/default.css" id="theme">
    """

  Scenario: Generating slides with a config
    Given a file named "config.toml" with:
    """
    title  = "Awesome Title"
    author = "Awesome Author"
    [presentation]
    theme  = "night"
    """
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
    And the file "slides/index.html" should contain:
    """
    <title>Awesome Title</title>
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="author" content="Awesome Author">
    """
    And the file "slides/index.html" should contain:
    """
    <link rel="stylesheet" href="css/theme/night.css" id="theme">
    """

  Scenario: Generating slides that reference local images
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
