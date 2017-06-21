Feature: How to store and reference a js plugin

  Contents of the `plugin` directory are recursively copied into the
  presentation.

  Scenario: Generating slides that contain a js plugin
    Given a file named "slides.md" with:
    """
    # Slides

    ---

    # They Change
    """
    And a file named "plugin/changed/changed.js" with:
    """
    (function(){
      Reveal.addEventListener('slidechanged', function(event) {
        console.log('slidechanged');
      });
    }());
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/plugin/changed/changed.js |
    And the file "slides/index.html" should contain:
    """
    baseOptions.dependencies.push({ src: 'plugin/changed/changed.js', async: true });
    """
