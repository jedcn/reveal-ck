Feature: How to configure reveal.js initialization options

  reveal.js provides the ability to customize dozens of initialization
  options.

  reveal-ck enables you change set these options via the central
  `config.yml` file.

  Scenario: Supplying reveal.js initialization options via config.yml
    Given a file named "slides.md" with:
    """
    # Slides
    """
    And a file named "config.yml" with:
    """
    init_js:
      autoSlide: 5000
      controls: false
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should contain:
    """
    autoSlide: 5000,
    """
    And the file "slides/index.html" should contain:
    """
    controls: false,
    """
