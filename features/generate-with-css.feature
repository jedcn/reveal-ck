Feature: How to store and reference css

  Files placed into the `css/` directory will be copied into the
  presentation.

  A `<link/>` will automatically be created to any file underneath
  `css` that ends in `.css`.

  Scenario: Generating slides that contain a css file
    Given a file named "slides.md" with:
    """
    # Slides
    """
    And a file named "css/custom.css" with:
    """
    body {
      background: red;
    }
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/css/custom.css |
    And the file "slides/index.html" should contain:
    """
    <link rel="stylesheet" href="css/custom.css">
    """
