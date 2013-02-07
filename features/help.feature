Feature: Getting Command Line Help

  reveal-ck provides general command line help to a user so that she
  understand what it does and is aware of the commands and options.

  Scenario: Show general help if reveal-ck is run without options
    When I run `reveal-ck`
    Then it should pass with:
    """
    help     - Shows a list of commands or help for one command
    """

  Scenario: Show general help if reveal-ck is run with --help
    When I run `reveal-ck --help`
    Then it should pass with:
    """
    help     - Shows a list of commands or help for one command
    """
