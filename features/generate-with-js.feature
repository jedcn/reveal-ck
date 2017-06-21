Feature: How to store and reference js

  Files placed into the `js/` directory will be copied into the
  presentation and included in the <head>.

  Scenario: Generating slides that contain a js file
    Given a file named "slides.md" with:
    """
    # Slides
    """
    And a file named "js/custom.js" with:
    """
    (function() {
      console.log('Hi from js/custom.js');
    })();
    """
    And a file named "js/nested/custom.js" with:
    """
    (function() {
      console.log('Hi from js/nested/custom.js');
    })();
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/js/custom.js |
    | slides/js/nested/custom.js |
    And the file "slides/index.html" should contain:
    """
    <script src="js/custom.js"></script>
    """
    And the file "slides/index.html" should contain:
    """
    <script src="js/nested/custom.js"></script>
    """
