Feature: Slides with markdown

  reveal-ck can create a presentation using [markdown][redcarpet].

  You should create a file named `slides.md` where each slide is
  separated by '---'. Then run `reveal-ck generate`.

  The '---' is used to separate slides rather than represent a
  `<hr/>`, and so it's not exactly markdown, but it's close.

  Further- you can also used the triple-fence block to quickly create
  speaker notes. See the example below.

  If you'd like to see the intermediate file where your `slides.md` is
  transformed into `.html` you can visit `slides/slides.html`

  [redcarpet]: https://github.com/vmg/redcarpet

  Scenario: Generating basic slides with slides.md
    Given a file named "slides.md" with:
    """
    # Reveal.js
    ### HTML Presentations Made Easy

    Created by [Hakim El Hattab][hakim]

    ---

    # THE END
    ### BY Hakim El Hattab / hakim.se

    [hakim]: http://hakim.se
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1[text()="Reveal.js"]                                 | the opening h1           |
    | //section/h3[text()="HTML Presentations Made Easy"]              | the opening h3           |
    | //section/h1[text()="THE END"]                                   | the closing h1           |
    | //section/p/a[@href='http://hakim.se'][text()="Hakim El Hattab"] | the link to hakim's site |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1[text()="Reveal.js"]                                 | the opening h1           |
    | //section/h3[text()="HTML Presentations Made Easy"]              | the opening h3           |
    | //section/h1[text()="THE END"]                                   | the closing h1           |
    | //section/p/a[@href='http://hakim.se'][text()="Hakim El Hattab"] | the link to hakim's site |

  Scenario: Authoring Speaker Notes with Markdown
    Given a file named "slides.md" with:
    """
    # Reveal.js
    ### HTML Presentations Made Easy

    ```notes
    This will be a speaker note
    ```

    ---

    # Second Slide

    ```note
    Another note (note the singular)
    ```
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/aside[@class="notes"]                             | a speaker note  |
    | //section/aside[contains(., "This will be a speaker note")] | the first note  |
    | //section/aside[contains(., "Another note")]                | the second note |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/aside[@class="notes"]                             | a speaker note  |
    | //section/aside[contains(., "This will be a speaker note")] | the first note  |
    | //section/aside[contains(., "Another note")]                | the second note |

  Scenario: Creating Vertically Condensed Speaker Notes with Markdown
    Given a file named "slides.md" with:
    """
    # Your headline
    * Bullet 1
    ---
    ## Next Slide
    * Bullet 1
    ---
    ### Final Slide
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section[1]/h1[text()="Your headline"] | the first slide's h1  |
    | //section[2]/h2[text()="Next Slide"]    | the second slide's h2 |
    | //section[3]/h3[text()="Final Slide"]   | the third slide's h3  |
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="Your headline"] | the first slide's h1  |
    | //section[2]/h2[text()="Next Slide"]    | the second slide's h2 |
    | //section[3]/h3[text()="Final Slide"]   | the third slide's h3  |
