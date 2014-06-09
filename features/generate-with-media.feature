Feature: How to store and reference media

  Files placed into the `media/` directory will be copied into the
  presentation.

  Scenario: Generating slides that contain a media file
    Given a file named "slides.md" with:
    """
    # Slides
    """
    And a file named "media/sample.mp4" with:
    """
    add-a-real-mp4-sometime-soon
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/media/sample.mp4 |
