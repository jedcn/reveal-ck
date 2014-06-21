Feature: Using Emoji in your Slides

  Emoji makes everything better, and so, emoji must make slides
  better, too. Right?

  Whether you're using html, markdown, haml, or whatever-- drop
  something like a :thumbsup: and it'll become an emoji image when you
  generate. This will happen in the intermediate `slides/slides.html`
  and the final `slides/index.html`.

  By default, we'll hotlink emoji from the same image location that
  github uses. Sooner or later this will change, or you won't want to
  depend on github, so it's configurable. You achieve this
  configurability by supplying an `asset_root` in the `config.yml`

  Finally-- reveal.js' standard CSS (which looks great on regular
  images) doesn't work so hot with emoji, and so, we include some
  default CSS from reveal-ck: reveal-ck.css. You can always supply
  your own CSS to override this.

  Scenario: Including Emoji in an html slides file
    Given a file named "slides.html" with:
    """
    <section>
      <h1>Emoji :thumbsup:</h1>
      <p>i :heart: it</p>
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/p/img[@class="emoji"]                                                    | an img with class emoji       |
    | //section/p/img[@title=":heart:"]                                                  | an img with title=":heart"    |
    | //section/p/img[@alt=":heart:"]                                                    | an img with alt=":heart"      |
    | //section/p/img[@src="https://assets-cdn.github.com/images/icons/emoji/heart.png"] | an img with src on github cdn |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/p/img[@class="emoji"]                                                    | an img with class emoji       |
    | //section/p/img[@title=":heart:"]                                                  | an img with title=":heart"    |
    | //section/p/img[@alt=":heart:"]                                                    | an img with alt=":heart"      |
    | //section/p/img[@src="https://assets-cdn.github.com/images/icons/emoji/heart.png"] | an img with src on github cdn |

  Scenario: Including Emoji in a markdown slides file
    Given a file named "slides.md" with:
    """
    # Emoji

    i :heart: it
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/p/img[@class="emoji"]                                                    | an img with class emoji       |
    | //section/p/img[@title=":heart:"]                                                  | an img with title=":heart"    |
    | //section/p/img[@alt=":heart:"]                                                    | an img with alt=":heart"      |
    | //section/p/img[@src="https://assets-cdn.github.com/images/icons/emoji/heart.png"] | an img with src on github cdn |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/p/img[@class="emoji"]                                                    | an img with class emoji       |
    | //section/p/img[@title=":heart:"]                                                  | an img with title=":heart"    |
    | //section/p/img[@alt=":heart:"]                                                    | an img with alt=":heart"      |
    | //section/p/img[@src="https://assets-cdn.github.com/images/icons/emoji/heart.png"] | an img with src on github cdn |
    | //link[@rel="stylesheet"][@href="css/reveal-ck.css"]                               | the default reveal-ck.css     |
    And a file named "slides/css/reveal-ck.css" should exist

  Scenario: Including Emoji hosted at a specific location
    Given a file named "slides.md" with:
    """
    # Emoji

    i :heart: it
    """
    And a file named "config.yml" with:
    """
    asset_root: http://localhost:10000/images
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/p/img[@src="http://localhost:10000/images/emoji/heart.png"] | an img with configured asset_root |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/p/img[@src="http://localhost:10000/images/emoji/heart.png"] | an img with configured asset_root |
