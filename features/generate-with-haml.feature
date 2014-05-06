Feature: Slides with haml

  reveal-ck can create a presentation using [haml][haml-info].

  You should create a file named `slides.haml` where each slide is
  contained with a `%section`. Then run `reveal-ck generate`.

  Your slides will be available at `slides/index.html`.

  If you'd like to see the intermediate file where your `slides.haml`
  is transformed into `.html` you can visit `slides/slides.html`

  [haml-info]: http://haml.info/

  Scenario: Generating basic slides with slides.haml
    Given a file named "slides.haml" with:
    """
    %section
      %p
        Slides with Haml
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.haml'..\n"
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <section>
      <p>
        Slides with Haml
      </p>
    </section>
    """
    And the file "slides/index.html" should contain:
    """
    <section>
      <p>
        Slides with Haml
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
    transition: 'default'
    """
