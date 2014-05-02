Feature: How to store and reference js

  Files placed into the `js/` directory will be copied into the
  presentation.

  Scenario: Generating slides that contain a css file
    Given a file named "slides.md" with:
    """
    # Slides
    """
    And a file named "js/custom.js" with:
    """
    (function() {
      alert('Hi');
    })();
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/js/custom.js |
