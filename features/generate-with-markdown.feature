Feature: Slides with markdown

  reveal-ck can create a presentation using [markdown][redcarpet].

  You should create a file named `slides.md` where each slide is
  separated by '---'. Then run `reveal-ck generate`.

  The '---' is used to separate slides rather than represent a
  `<hr/>`, and so it's not exactly markdown, but it's close.

  Further- you can also used the triple-fence block to quickly create
  speaker notes. See the example below.

  If you like to put tables in your slides, you can use the tables
  from [Github Flavored Markdown][github-flavored-markdown].

  If you'd like to see the intermediate file where your `slides.md` is
  transformed into `.html` you can visit `slides/slides.html`

  [redcarpet]: https://github.com/vmg/redcarpet
  [github-flavored-markdown]: https://help.github.com/articles/github-flavored-markdown/

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
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="Your headline"] | the first slide's h1  |
    | //section[2]/h2[text()="Next Slide"]    | the second slide's h2 |
    | //section[3]/h3[text()="Final Slide"]   | the third slide's h3  |

  Scenario: Using "Github Flavored Markdown" Tables
    Given a file named "slides.md" with:
    """
    # Welcome
    ---
    ## Superb Tables
    Item          | Value         | Quantity
    ------------- | ------------- | ---------
    Apples        | $1            |       18
    Lemonade      | $2            |       20
    Bread         | $3.50         |        2
    ---
    # Thank You
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="Welcome"]                     | the first slide's h1 |
    | //section[2]/table                                    | the table exists     |
    | //section[2]/table/thead/tr/th[1][text()="Item"]      | Column 1 Header      |
    | //section[2]/table/thead/tr/th[2][text()="Value"]     | Column 2 Header      |
    | //section[2]/table/thead/tr/th[3][text()="Quantity"]  | Column 3 Header      |
    | //section[2]/table/tbody/tr[1]/td[1][text()="Apples"] | Column 1, Row 1      |
    | //section[2]/table/tbody/tr[1]/td[2][text()="$1"]     | Column 1, Row 2      |
    | //section[2]/table/tbody/tr[1]/td[3][text()="18"]     | Column 1, Row 3      |
    | //section[2]/table/tbody/tr[3]/td[1][text()="Bread"]  | Column 3, Row 1      |
    | //section[2]/table/tbody/tr[3]/td[2][text()="$3.50"]  | Column 3, Row 2      |
    | //section[2]/table/tbody/tr[3]/td[3][text()="2"]      | Column 3, Row 3      |
    | //section[3]/h1[text()="Thank You"]                   | the third slide's h1 |

  Scenario: Using "Github Flavored Markdown" Tables with "Pipes"
    Given a file named "slides.md" with:
    """
    # Welcome
    ---
    ## Superb Tables
    | Item          | Value         | Quantity  |
    | ------------- | ------------- | --------- |
    | Apples        | $1            |       18  |
    | Lemonade      | $2            |       20  |
    | Bread         | $3.50         |        2  |
    ---
    # Thank You
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="Welcome"]                     | the first slide's h1 |
    | //section[2]/table                                    | the table exists     |
    | //section[2]/table/thead/tr/th[1][text()="Item"]      | Column 1 Header      |
    | //section[2]/table/thead/tr/th[2][text()="Value"]     | Column 2 Header      |
    | //section[2]/table/thead/tr/th[3][text()="Quantity"]  | Column 3 Header      |
    | //section[2]/table/tbody/tr[1]/td[1][text()="Apples"] | Column 1, Row 1      |
    | //section[2]/table/tbody/tr[1]/td[2][text()="$1"]     | Column 1, Row 2      |
    | //section[2]/table/tbody/tr[1]/td[3][text()="18"]     | Column 1, Row 3      |
    | //section[2]/table/tbody/tr[3]/td[1][text()="Bread"]  | Column 3, Row 1      |
    | //section[2]/table/tbody/tr[3]/td[2][text()="$3.50"]  | Column 3, Row 2      |
    | //section[2]/table/tbody/tr[3]/td[3][text()="2"]      | Column 3, Row 3      |
    | //section[3]/h1[text()="Thank You"]                   | the third slide's h1 |

  Scenario: Using "Github Flavored Markdown" Tables with "Unaligned Whitespace"
    Given a file named "slides.md" with:
    """
    # Welcome
    ---
    ## Superb Tables
    | Item | Value | Quantity |
    | -------- | ------------- | --------- |
    | Apples  | $1 |      18  |
    | Lemonade | $2  |  20  |
    | Bread  | $3.50  |  2  |
    ---
    # Thank You
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="Welcome"]                     | the first slide's h1 |
    | //section[2]/table                                    | the table exists     |
    | //section[2]/table/thead/tr/th[1][text()="Item"]      | Column 1 Header      |
    | //section[2]/table/thead/tr/th[2][text()="Value"]     | Column 2 Header      |
    | //section[2]/table/thead/tr/th[3][text()="Quantity"]  | Column 3 Header      |
    | //section[2]/table/tbody/tr[1]/td[1][text()="Apples"] | Column 1, Row 1      |
    | //section[2]/table/tbody/tr[1]/td[2][text()="$1"]     | Column 1, Row 2      |
    | //section[2]/table/tbody/tr[1]/td[3][text()="18"]     | Column 1, Row 3      |
    | //section[2]/table/tbody/tr[3]/td[1][text()="Bread"]  | Column 3, Row 1      |
    | //section[2]/table/tbody/tr[3]/td[2][text()="$3.50"]  | Column 3, Row 2      |
    | //section[2]/table/tbody/tr[3]/td[3][text()="2"]      | Column 3, Row 3      |
    | //section[3]/h1[text()="Thank You"]                   | the third slide's h1 |

  Scenario: Using "Github Flavored Markdown" Tables with "Embedded Markdown"
    Given a file named "slides.md" with:
    """
    # Welcome
    ---
    ## Superb Tables
    Item          | Value         | Quantity
    ------------- | ------------- | ---------
    ~~Apples~~    | $1            |    ==18==
    Lemonade      | $2            |        20
    _Bread_       | **$3.50**     |         2
    ---
    # Thank You
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="Welcome"]                           | the first slide's h1           |
    | //section[2]/table                                          | the table exists               |
    | //section[2]/table/thead/tr/th[1][text()="Item"]            | Column 1 Header                |
    | //section[2]/table/thead/tr/th[2][text()="Value"]           | Column 2 Header                |
    | //section[2]/table/thead/tr/th[3][text()="Quantity"]        | Column 3 Header                |
    | //section[2]/table/tbody/tr[1]/td[1]/del[text()="Apples"]   | Column 1, Row 1, Struckthrough |
    | //section[2]/table/tbody/tr[1]/td[2][text()="$1"]           | Column 1, Row 2                |
    | //section[2]/table/tbody/tr[1]/td[3]/mark[text()="18"]      | Column 1, Row 3, Marked        |
    | //section[2]/table/tbody/tr[3]/td[1]/em[text()="Bread"]     | Column 3, Row 1, Emphasized    |
    | //section[2]/table/tbody/tr[3]/td[2]/strong[text()="$3.50"] | Column 3, Row 2, Strong        |
    | //section[2]/table/tbody/tr[3]/td[3][text()="2"]            | Column 3, Row 3                |

  Scenario: Using "Github Flavored Markdown" Tables with "Aligned Columns"
    Given a file named "slides.md" with:
    """
    # Welcome
    ---
    ## Superb Tables
    Item           | Value           | Quantity
    :------------- | :-------------: | ---------:
    Apples         | $1              |       18
    Lemonade       | $2              |       20
    Bread          | $3.50           |        2
    ---
    # Thank You
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[2]/table/thead/tr/th[1][@style="text-align: left"]      | Left Aligned Column 1 Header   |
    | //section[2]/table/thead/tr/th[2][@style="text-align: center"]    | Center Aligned Column 2 Header |
    | //section[2]/table/thead/tr/th[3][@style="text-align: right"]     | Right Aligned Column 3 Header  |
    | //section[2]/table/tbody/tr[1]/td[1][@style="text-align: left"]   | Left Aligned Column 1, Row 1   |
    | //section[2]/table/tbody/tr[1]/td[2][@style="text-align: center"] | Center Aligned Column 1, Row 2 |
    | //section[2]/table/tbody/tr[1]/td[3][@style="text-align: right"]  | Right Aligned Column 1, Row 3  |
