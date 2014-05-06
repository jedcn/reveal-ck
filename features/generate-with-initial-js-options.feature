Feature: How to configure reveal.js initialization options

  reveal.js provides the ability to customize dozens of initialization
  options.

  reveal-ck enables you change set these options via the central
  `config.yml` file and the Ruby DSL.

  Scenario: Supplying reveal.js initialization options via config.yml
    Given a file named "slides.md" with:
    """
    # Slides
    ---
    # Are Fun
    ---
    # Don't You Think?
    """
    And a file named "config.yml" with:
    """
    revealjs_config:
      autoSlide: 5000
      loop: true
      parallaxBackgroundImage: 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should contain:
    """
    "autoSlide":5000,
    """
    And the file "slides/index.html" should contain:
    """
    "loop":true,
    """
    And the file "slides/index.html" should contain:
    """
    "parallaxBackgroundImage":"https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg"
    """

  Scenario: Supplying reveal.js initialization options via DSL
    Given a file named "slides.rb" with:
    """
    presentation do

      revealjs_config 'autoSlide', 5000
      revealjs_config 'loop', true
      revealjs_config 'parallaxBackgroundImage', 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'

      slide 'text', content: 'Slides'
      slide 'text', content: 'Are Fun'
      slide 'text', content: "Don't you think?"

    end
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the file "slides/index.html" should contain:
    """
    "autoSlide":5000,
    """
    And the file "slides/index.html" should contain:
    """
    "loop":true,
    """
    And the file "slides/index.html" should contain:
    """
    "parallaxBackgroundImage":"https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg"
    """
