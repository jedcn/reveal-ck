Feature: reveal-ck generate --dir

  By default, `reveal-ck generate` creates slides in a directory named after the slide file.

  And this is known as your 'slides directory.'

  The slide directory from a slide file named 'slides.md' or 'slides.textile' will be 'slides.'

  However, if you'd prefer, you can create an alternate directory
  `slides_for_google_talk` and have reveal-ck use that instead. To
  do this, you'd say:

      reveal-ck generate --directory 'slides_for_google_talk'

  Scenario: Generating custom slide directory
    Given a file named "slides.haml" with:
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
    When I run `reveal-ck generate --dir slides_for_google_talk`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.haml'..\n"
    And the following files should exist:
    | slides_for_google_talk/slides.html |
    | slides_for_google_talk/index.html  |
