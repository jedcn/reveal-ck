Feature: How to store and reference css

  You might be interested in visually tweaking parts of your
  presentation. You can do this with CSS.

  If you'd like to add CSS that impacts your presentation, create a
  directory named `css/` and add a file in that directory that ends
  with `.css`.

  For example-- put your CSS into `css/custom.css`.

  Any file that:

  * Is underneath `css/`
  * And ends in `.css`

  Will be copied into the presentation. A `<link/>` will automatically
  be created to it within the `<head/>` of the final presentation.

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
    And a file named "css/nested/custom.css" with:
    """
    p {
      background: blue;
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
