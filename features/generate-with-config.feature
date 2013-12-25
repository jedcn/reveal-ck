Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

  Scenario: Generating slides with a template and config.yml
    Given a file named "config.yml" with:
    """
    title:      "Awesome Title"
    author:     "Awesome Author"
    theme:      "night"
    transition: "page"
    """
    Given a file named "slides.haml" with:
    """
    %section
      %p
        Config
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.haml'..\n"
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
    And the file "slides/index.html" should contain:
    """
    transition: Reveal.getQueryHash().transition || 'page'
    """

  Scenario: Generating slides with slides.rb and config.yml
    Given a file named "config.yml" with:
    """
    title:      "Awesome Title"
    author:     "Awesome Author"
    theme:      "night"
    transition: "page"
    """
    Given a file named "slides.rb" with:
    """
    presentation do
      slide 'text', content: 'Config'
    end
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.rb'..\n"
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
    And the file "slides/index.html" should contain:
    """
    transition: Reveal.getQueryHash().transition || 'page'
    """
