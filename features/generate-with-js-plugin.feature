Feature: How to store and reference a js plugin

  Contents of the `plugin` directory are recursively copied into the
  presentation.

  Scenario: Generating slides that contain a css file
    Given a file named "slides.md" with:
    """
    # Slides
    """
    And a file named "plugin/sample/sample.js" with:
    """
    (function() {
      alert('Hi');
    })();
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/plugin/sample/sample.js |
