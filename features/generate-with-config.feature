Feature: The capabilities of config.yml

  When you're creating a presentation you mainly focus your efforts on
  your 'slides file'. This contains your content.

  However, `config.yml` is another file that plays an important role:
  it lets you supply general configuration. You can call out:

  * The theme of your presentation
  * The transitions used in your presentation
  * The title of your presentation
  * The author of your presentation

  It is taken into account when you run a `reveal-ck generate`.

  Scenario: Generating slides with a template and config.yml
    Given a file named "config.yml" with:
    """
    title:       "Awesome Title"
    author:      "Awesome Author"
    theme:       "night"
    transition:  "page"
    description: "My beautiful slides"
    """
    Given a file named "slides.haml" with:
    """
    %section
      %p
        Config
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.haml'..\n"
    And the following files should exist:
    | slides/index.html  |
    And the file "slides/index.html" should contain:
    """
    <title>Awesome Title</title>
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="author" content="Awesome Author">
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="description" content="My beautiful slides">
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="generator" content="reveal-ck
    """
    And the file "slides/index.html" should contain:
    """
    <link rel="stylesheet" href="css/theme/night.css" id="theme">
    """
    And the file "slides/index.html" should contain:
    """
    transition: 'page'
    """

  Scenario: Generating slides with slides.rb and config.yml
    Given a file named "config.yml" with:
    """
    title:      "Awesome Title"
    author:     "Awesome Author"
    theme:      "night"
    transition: "page"
    """
    Given a file named "slides.rb" with:
    """
    presentation do
      slide 'text', content: 'Config'
    end
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.rb'..\n"
    And the following files should exist:
    | slides/index.html  |
    And the file "slides/index.html" should contain:
    """
    <title>Awesome Title</title>
    """
    And the file "slides/index.html" should contain:
    """
    <meta name="author" content="Awesome Author">
    """
    And the file "slides/index.html" should contain:
    """
    <link rel="stylesheet" href="css/theme/night.css" id="theme">
    """
    And the file "slides/index.html" should contain:
    """
    transition: 'page'
    """

  Scenario: Generating slides with custom filters and requires
    Given a file named "config.yml" with:
    """
    filters:
      - 'HTML::Pipeline::ItsFilter'
    requires:
      - './its_filter'
    """
    And a file named "its_filter.rb" with:
    """
    module HTML
      class Pipeline
        class ItsFilter < TextFilter
          def call
            # Certain people prefer to say "It is" rather than "It’s"
            @text.gsub(/It’s/, 'It is')
          end
        end
      end
    end
    """
    And a file named "slides.md" with:
    """
    It's not professional.
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.md'..\n"
    And the following files should exist:
    | slides/index.html  |
    And the file "slides/index.html" should contain:
    """
    <p>It is not professional.</p>
    """

  Scenario: Referencing config data with a templating language
    Given a file named "config.yml" with:
    """
    data:
      neat_image: 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'
    """
    Given a file named "slides.haml" with:
    """
    %section
      %img{ src: "#{config.data['neat_image']}" }
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/index.html  |
    And the file "slides/index.html" should have html matching the css:
    | img[src*="reveal-js/reveal-parallax-1.jpg"] | the referenced image |

  Scenario: Referencing config data with ruby
    Given a file named "config.yml" with:
    """
    data:
      neat_image: 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'
    """
    Given a file named "slides.rb" with:
    """
    presentation do
      slide 'neat_image'
    end
    """
    Given a file named "templates/neat_image.haml" with:
    """
    %section
      %img{ src: "#{config.data['neat_image']}" }
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/index.html  |
    And the file "slides/index.html" should have html matching the css:
    | img[src*="reveal-js/reveal-parallax-1.jpg"]  | the referenced image |

  Scenario: Generating slides with a template and og configs
    Given a file named "config.yml" with:
    """
    meta_properties:
      og:title: "reveal-ck"
    """
    Given a file named "slides.haml" with:
    """
    %section
      %p
        Config
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.haml'..\n"
    And the following files should exist:
      | slides/index.html  |
    And the file "slides/index.html" should contain:
    """
    <meta property="og:title" content="reveal-ck" />
    """

  Scenario: Generating slides with a template and twitter configs
    Given a file named "config.yml" with:
    """
    meta_names:
      twitter:title: "reveal-ck"
    """
    Given a file named "slides.haml" with:
    """
    %section
      %p
        Config
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.haml'..\n"
    And the following files should exist:
      | slides/index.html  |
    And the file "slides/index.html" should contain:
    """
    <meta name="twitter:title" content="reveal-ck" />
    """
