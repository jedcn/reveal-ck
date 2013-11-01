Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command against the ruby dsl

  Scenario: Generating slides with slides.rb
    Given a file named "slides.rb" with:
    """
    presentation do
      slide 'text', content: 'Slides with Ruby'
    end
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly ""
    And the following files should exist:
    | slides/slides.html  |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <section>
      <p>
        Slides with Ruby
      </p>
    </section>
    """
    And the file "slides/index.html" should contain:
    """
    <section>
      <p>
        Slides with Ruby
      </p>
    </section>
    """
    And the file "slides/index.html" should contain:
    """
    <title>Slides</title>
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="author" content="">
    """
    And the file "slides/index.html" should contain:
    """
    <link rel="stylesheet" href="css/theme/default.css" id="theme">
    """
    And the file "slides/index.html" should contain:
    """
    transition: Reveal.getQueryHash().transition || 'default'
    """

  Scenario: Generating slides with slides.rb and a config.yml
    Given a file named "slides.rb" with:
    """
    presentation do
      author 'Jed Northridge'
      theme 'night'
      slide 'text', content: 'Slides with Ruby'
    end
    """
    Given a file named "config.yml" with:
    """
    theme: "beige"
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly ""
    And the following files should exist:
    | slides/slides.html  |
    | slides/index.html  |
    And the file "slides/index.html" should contain:
    """
    <title>Slides</title>
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="author" content="Jed Northridge">
    """
    And the file "slides/index.html" should contain:
    """
    <link rel="stylesheet" href="css/theme/night.css" id="theme">
    """
