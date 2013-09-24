Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

  Scenario: Generating slides with a template and config.toml
    Given a file named "config.toml" with:
    """
    title      = "Awesome Title"
    author     = "Awesome Author"
    [presentation]
    theme      = "night"
    """
    Given a file named "slides.haml" with:
    """
    %section
      %p
        Config
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly ""
    And the following files should exist:
    | slides/index.html  |
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

  Scenario: Generating slides with slides.rb and config.toml
    Given a file named "config.toml" with:
    """
    title      = "Awesome Title"
    author     = "Awesome Author"
    [presentation]
    theme      = "night"
    """
    Given a file named "slides.rb" with:
    """
    presentation do
      title      = 'Ignored Awesome Title'
      author     = 'Ignored Awesome Author'
      theme      = 'ignored-beige'
      slide 'text', content: 'Config'
    end
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly ""
    And the following files should exist:
    | slides/index.html  |
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
