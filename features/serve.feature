Feature: Using 'reveal-ck serve'

  reveal-ck has two main commands: `generate` and `serve`.

  `generate` builds slides.

  `serve` is a longer running and more complicated process:

  * It starts up a webserver to serve up your slides
  * It listens for file system changes to rebuild your slides
  * It reloads your browser when slides are regenerated

  It's expected that most users will usually just run `reveal-ck
  serve`.

  However, for testing purposes, we can run reveal-ck serve in a mode
  where it starts up and shuts down after a few moments. This allows
  us to quickly verify that things are looking good.

  Scenario: Starting up `reveal-ck serve`
    Given a file named "slides.md" with:
    """
    # reveal-ck serve
    """
    When I run `reveal-ck serve --test-quit-after-starting 2`
    Then the exit status should be 1
    # The banner prints..
    And the output should contain "[ reveal-ck ] Serving up slide content in 'slides/'."
    And the output should contain "[ reveal-ck ] Open your browser to 'http://localhost:10000'."
    And the output should contain "[ reveal-ck ] Press CTRL-C to stop."
    # We're ready to rebuild
    And the output should contain "[ reveal-ck ] Getting Ready to Rebuild Slides."
    # We're ready to serve files
    And the output should contain "[ reveal-ck ] Starting Webserver."
    # We're ready to reload
    And the output should contain "[   reload  ] Guard is now watching"
