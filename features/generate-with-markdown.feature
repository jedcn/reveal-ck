Feature: Slides with markdown

  reveal-ck can create a presentation using [markdown][kramdown].

  You should create a file named `slides.md` where each slide is
  separated by '---'. Then run `reveal-ck generate`.

  The '---' is used to separate slides rather than represent a
  `<hr/>`, and so it's not exactly markdown, but it's close.

  Further- you can also used the triple-fence block to quickly create
  speaker notes. See the example below.

  If you like to put tables in your slides, you can use the tables
  from [Github Flavored Markdown][github-flavored-markdown].

  Finally-- unlike many other slide frameworks, reveal.js supports
  vertical slides. You can start a series of vertical slides with
  `***`. If you want to stop "going vertical" you can use another
  `***`. Once you you realize that vertical is an option, you can
  choose to do columns back-to-back, columns separated by horizontal
  slides, etc. Check out several examples below.

  If you'd like to see the intermediate file where your `slides.md` is
  transformed into `.html` you can visit `slides/slides.html`

  [kramdown]: https://github.com/gettalong/kramdown
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
    ------------- | ------------- | ---------------
    ~~Apples~~    | $1            | <mark>18</mark>
    Lemonade      | $2            | 20
    _Bread_       | **$3.50**     | 2
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

  Scenario: Creating a single column of vertical slides
    Given a file named "slides.md" with:
    """
    ***
    # Column 1, Slide 1
    ---
    # Column 1, Slide 2
    ---
    # Column 1, Slide 3
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/section[1]/h1[text()="Column 1, Slide 1"] | Column 1, Slide 1 |
    | //section[1]/section[2]/h1[text()="Column 1, Slide 2"] | Column 1, Slide 2 |
    | //section[1]/section[3]/h1[text()="Column 1, Slide 3"] | Column 1, Slide 3 |

  Scenario: Creating a single column of vertical slides
    Given a file named "slides.md" with:
    """
    ***
    # Column 1, Slide 1
    ---
    # Column 1, Slide 2
    ---
    # Column 1, Slide 3
    ***
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/section[1]/h1[text()="Column 1, Slide 1"] | Column 1, Slide 1 |
    | //section[1]/section[2]/h1[text()="Column 1, Slide 2"] | Column 1, Slide 2 |
    | //section[1]/section[3]/h1[text()="Column 1, Slide 3"] | Column 1, Slide 3 |

  Scenario: Creating a slide, a single column of vertical slides, and final slide
    Given a file named "slides.md" with:
    """
    # First
    ***
    # Column 1, Slide 1
    ---
    # Column 1, Slide 2
    ---
    # Column 1, Slide 3
    ***
    # Last
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="First"]                        | First slide       |
    | //section[2]/section[1]/h1[text()="Column 1, Slide 1"] | Column 1, Slide 1 |
    | //section[2]/section[2]/h1[text()="Column 1, Slide 2"] | Column 1, Slide 2 |
    | //section[2]/section[3]/h1[text()="Column 1, Slide 3"] | Column 1, Slide 3 |
    | //section[3]/h1[text()="Last"]                         | Last Slide        |

  Scenario: Creating a slide, two columns of vertical slides, and final slide
    Given a file named "slides.md" with:
    """
    # First
    ***
    # Column 1, Slide 1
    ---
    # Column 1, Slide 2
    ---
    # Column 1, Slide 3
    ***
    ***
    # Column 2, Slide 1
    ---
    # Column 2, Slide 2
    ---
    # Column 2, Slide 3
    ***
    # Last
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="First"]                        | First slide       |
    | //section[2]/section[1]/h1[text()="Column 1, Slide 1"] | Column 1, Slide 1 |
    | //section[2]/section[2]/h1[text()="Column 1, Slide 2"] | Column 1, Slide 2 |
    | //section[2]/section[3]/h1[text()="Column 1, Slide 3"] | Column 1, Slide 3 |
    | //section[3]/section[1]/h1[text()="Column 2, Slide 1"] | Column 2, Slide 1 |
    | //section[3]/section[2]/h1[text()="Column 2, Slide 2"] | Column 2, Slide 2 |
    | //section[3]/section[3]/h1[text()="Column 2, Slide 3"] | Column 2, Slide 3 |
    | //section[4]/h1[text()="Last"]                         | Last Slide        |

  Scenario: Creating a slide, a column, a slide, a column, and a final slide
    Given a file named "slides.md" with:
    """
    # First
    ***
    # Column 1, Slide 1
    ---
    # Column 1, Slide 2
    ---
    # Column 1, Slide 3
    ***
    # Middle
    ***
    # Column 2, Slide 1
    ---
    # Column 2, Slide 2
    ---
    # Column 2, Slide 3
    ***
    # Last
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section[1]/h1[text()="First"]                        | First slide       |
    | //section[2]/section[1]/h1[text()="Column 1, Slide 1"] | Column 1, Slide 1 |
    | //section[2]/section[2]/h1[text()="Column 1, Slide 2"] | Column 1, Slide 2 |
    | //section[2]/section[3]/h1[text()="Column 1, Slide 3"] | Column 1, Slide 3 |
    | //section[3]/h1[text()="Middle"]                       | Middle slide      |
    | //section[4]/section[1]/h1[text()="Column 2, Slide 1"] | Column 2, Slide 1 |
    | //section[4]/section[2]/h1[text()="Column 2, Slide 2"] | Column 2, Slide 2 |
    | //section[4]/section[3]/h1[text()="Column 2, Slide 3"] | Column 2, Slide 3 |
    | //section[5]/h1[text()="Last"]                         | Last Slide        |

  Scenario: Creating a slide with HTML special characters
    Given a file named "slides.md" with:
    """
    ```
    user=> (atom 10)
    #<Atom@6cbda790: 10>
    ```
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section/pre/code[contains(., 'user=>')]               | first line of escaped code  |
    | //section/pre/code[contains(., "#<Atom@6cbda790: 10>")] | second line of escaped code |
    And the file "slides/index.html" should contain:
    """
    user=&gt; (atom 10)
    """
    And the file "slides/index.html" should contain:
    """
    #&lt;Atom@6cbda790: 10&gt;
    """

  Scenario: Creating a slide with notes that contain markdown
    Given a file named "slides.md" with:
    """
    # Hello There!

    ```notes
    Remember to *smile*
    ```
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
    | //section/aside[contains(., "Remember to smile")] | the note to remember |
    | //section/aside/p/em[contains(., "smile")]        | smile is in <em>s    |

  Scenario: Creating a slide that has heading that becomes visible
    Given a file named "slides.md" with:
    """
    {:.fragment}
    # Hello There!
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
      | //section//h1[contains(@class, 'fragment') and text() = 'Hello There!'] | an h1 with a class of fragment |

  Scenario: Creating a slide that has bullet points that become visible
    Given a file named "slides.md" with:
    """
    * This is..
    * {:.fragment} pretty neat!
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
      | //section//li[contains(@class, 'fragment') and text() = 'pretty neat!'] | an li with a class of fragment |

  Scenario: Creating a slide that has code that become visible
    Given a file named "slides.md" with:
    """
    {:.fragment}
    ```
      def hello_world
        puts 'Hello World!'
      end
    ```
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
      | //section//pre[contains(@class, 'fragment')] | the pre surrounding the code with a class of fragment |


  Scenario: Creating a slide that has code that become visible
    Given a file named "slides.md" with:
    """
    {:.fragment}
    Be Kind;

    {:.fragment}
    Everyone You Meet

    {:.fragment}
    is Fighting a Hard Battle
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
      | //section//p[contains(@class, 'fragment') and text() = 'Be Kind;' ]          | the first paragraph with a class of fragment  |
      | //section//p[contains(@class, 'fragment') and text() = 'Everyone You Meet' ] | the second paragraph with a class of fragment |

  Scenario: Creating a slide that has paragraphs which become visible in a specified order
    Given a file named "slides.md" with:
    """
    {:.fragment data-fragment-index="2"}
    Be Kind:

    Everyone You Meet

    {:.fragment data-fragment-index="1"}
    is Fighting a Hard Battle
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should have html matching the xpath:
      | //section//p[text() = 'Everyone You Meet' ]                                                                       | revealed first even though comes second |
      | //section//p[contains(@class, 'fragment') and @data-fragment-index="1" and text() = 'is Fighting a Hard Battle' ] | revealed first even though comes second |
      | //section//p[contains(@class, 'fragment') and @data-fragment-index="2" and text() = 'Be Kind:' ]                  | revealed second even though comes first |
