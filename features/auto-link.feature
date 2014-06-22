Feature: Auto-linking in your Slides

  If you are creating a slide, and you write out: https://github.com,
  you probably meant for that to be a link.

  So auto-linking is when you get to write: 'https://github.com' but
  you end up with `<a href="https://github.com">https://github.com</a>`

  It is setup to be on regardless of which format you're working with:
  markdown, html, erb, haml, etc. However, you can turn it off if you
  put `autolink: false` in your `config.yml`

  Scenario: Autolinking a URL in html
    Given a file named "slides.html" with:
    """
    <section>
      <h1>https://github.com/</h1>
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"] | link to github |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"]  | link to github |

  Scenario: Autolinking a URL in markdown
    Given a file named "slides.md" with:
    """
    # https://github.com/
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"]  | link to github |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"]  | link to github |

  Scenario: Autolinking a URL in erb
    Given a file named "slides.html.erb" with:
    """
    <section>
      <h1>https://github.com/</h1>
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"]  | link to github |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"]  | link to github |

  Scenario: Autolinking a URL in HAML
    Given a file named "slides.haml" with:
    """
    %section
      %h1 https://github.com/
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"]  | link to github |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1/a[@href="https://github.com/"]  | link to github |

  Scenario: Turning off Autolinking
    Given a file named "slides.md" with:
    """
    # https://github.com/
    """
    And a file named "config.yml" with:
    """
    autolink: false
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should not contain "<a href="
    And the file "slides/index.html" should not contain "<a href="
