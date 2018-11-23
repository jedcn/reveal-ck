Feature: Getting Command Line Help

  reveal-ck provides general command line help to a user so that she
  understands what it does and is aware of the commands and options.

  Scenario: Show general help if reveal-ck is run without options
    When I run `reveal-ck`
    Then the exit status should be 0
    And the output should match:
    """
    COMMANDS
     * generate      * - Generate reveal.js slides
     * help          * - Shows a list of commands or help for one command
     * serve, server * - Start webserver so slides are available via http
    """
    And the output should match:
    """
    A reveal.js construction kit
    """

  Scenario: Show general help if reveal-ck is run with --help
    When I run `reveal-ck --help`
    Then the exit status should be 0
    And the output should match:
    """
    COMMANDS
     * generate      * - Generate reveal.js slides
     * help          * - Shows a list of commands or help for one command
     * serve, server * - Start webserver so slides are available via http
    """

  Scenario: Show the version of reveal-ck if reveal-ck is run with --version
    When I run `reveal-ck --version`
    Then the exit status should be 0
    And the output should match:
    """
    reveal-ck version \d.\d.\d
    """

  Scenario: You need a slides file to get going
    When I run `reveal-ck generate`
    Then the exit status should be 1
    And the output should match:
    """
    Create a file matching slides.* to proceed, such as slides.md
    """

  Scenario: You need a slides file to get going
    When I run `reveal-ck serve`
    Then the exit status should be 1
    And the output should match:
    """
    Create a file matching slides.* to proceed, such as slides.md
    """
