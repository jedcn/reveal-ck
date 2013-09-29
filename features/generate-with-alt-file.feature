Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command

  Scenario: Generating basic slides any file
    Given a file named "hump-day.haml" with:
    """
    %section
      %h2
        Uh oh!

    %section
      %h3
        Guess what day it is?

    %section
      %h3
        Guess what day it is!

    %section
      %h3
        Huh?

    %section
      %h3
        Anybody?
    """
    When I run `reveal-ck generate --file hump-day.haml`
    Then the exit status should be 0
    And the output should contain exactly ""
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
