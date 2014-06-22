Feature: Mentioning @user in your Slides

  If you're rolling around in your slides, and you drop an `@jedcn`
  it's reasonable that this becomes a link to something meaningful
  when you make slides, no?

  The only place I'm `@jedcn` with any regularity is github, and so,
  for now the "default place" this will point to will be
  https://github.com/.

  However-- you may use reveal-ck and you may love twitter-- and
  that's nice.

  So-- this is configurable.  If you'd like to change the site that an
  \@user aims at, you can add an entry named 'base_url'to your
  `config.yml` so that it points to https://twitter.com/.

  Scenario: Dropping an @jedcn for github in an html slides file
    Given a file named "slides.html" with:
    """
    <section>
      <h1>@jedcn</h1>
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/jedcn"] | link to jedcn on github |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/jedcn"] | link to jedcn on github |

  Scenario: Dropping an @jedcn on twitter in a markdown slides file
    Given a file named "slides.md" with:
    """
    # @jedcn
    """
    And a file named "config.yml" with:
    """
    base_url: 'https://twitter.com/'
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1/a[@href="https://twitter.com/jedcn"] | link to jedcn on twitter |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1/a[@href="https://twitter.com/jedcn"] | link to jedcn on twitter |
