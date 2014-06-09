Feature: reveal-ck generate --file

  By default, `reveal-ck generate` looks for file names like:

  * slides.md
  * slides.textile
  * slides.haml
  * slides.slim
  * slides.rb

  And this is known as your 'slides file.'

  However, if you'd prefer, you can create an alternate file like
  `slides_for_google_talk.md` and have reveal-ck use that instead. To
  do this, you'd say:

      reveal-ck generate --file 'slides_for_google_talk.md'

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
    And the output should contain exactly "Generating slides for 'hump-day.haml'..\n"
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
