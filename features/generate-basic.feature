Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

  Scenario: Generating basic slides with Haml
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

  Scenario: Generating basic slides with Slim
    Given a file named "slides.slim" with:
    """
    section
      h1 Made with RevealCK
      p.small oh yeah!
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
      <p class="small">
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
      <p class="small">
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

  Scenario: Generating basic slides with Ruby
    Given a file named "slides.rb" with:
    """
    presentation do
      slide 'text',
            headline: 'Made with RevealCK',
            content:  'oh yeah!'
    end
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
      <h2>
        Made with RevealCK
      </h2>
      <p>
        oh yeah!
      </p>
    </section>


    """
    And the file "slides/index.html" should contain:
    """
    <section>
      <h2>
        Made with RevealCK
      </h2>
      <p>
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
