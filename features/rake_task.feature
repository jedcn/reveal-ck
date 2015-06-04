Feature: rake task

  reveal-ck ships with a rake task to generate slides.

  Scenario: Setting up basic task and generating a slide deck
    Given a file named "Rakefile" with:
    """
    require 'reveal-ck/rake_task'

    RevealCK::RakeTask.new

    task default: :reveal
    """
    And a file named "slides.md" with:
    """
    # Hello
    ## From
    ### Rake with Markdown
    """
    When I run `rake`
    Then the output should match:
    """
    Generating slides for 'slides.md'..
    """
    And the exit status should be 0
    And the following files should exist:
    | slides/index.html  |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1[text()="Hello"]              | the #   |
    | //section/h2[text()="From"]               | the ##  |
    | //section/h3[text()="Rake with Markdown"] | the ### |

  Scenario: Customizing a task to use a non-standard file name and directory
    Given a file named "Rakefile" with:
    """
    require 'reveal-ck/rake_task'

    RevealCK::RakeTask.new do |t|
      t.file = 'alternative.haml'
      t.dir  = 'alternative'
    end

    task default: :reveal
    """
    And a file named "alternative.haml" with:
      """
      %section
        %h1 Hello
        %h2 From
        %h3 Rake with haml
      """
    When I run `rake`
    Then the output should match:
      """
      Generating slides for 'alternative.haml'..
      """
    And the exit status should be 0
    And the following files should exist:
    | alternative/index.html  |
    And the file "alternative/index.html" should have html matching the xpath:
    | //section/h1[text()="Hello"]          | the %h1 |
    | //section/h2[text()="From"]           | the %h2 |
    | //section/h3[text()="Rake with haml"] | the %h3 |

  Scenario: Supplying a different task name and description
    Given a file named "Rakefile" with:
    """
    require 'reveal-ck/rake_task'

    desc 'Alternative Description'
    RevealCK::RakeTask.new(:alternative_task_name)

    task default: :reveal
    """
    When I run `rake -T`
    Then the output should match:
      """
      rake alternative_task_name  # Alternative Description
      """
    And the exit status should be 0
