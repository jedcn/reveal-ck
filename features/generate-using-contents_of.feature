Feature: Generate slides

  In order to easily generate reveal.js presentations
  As a user of reveal-ck
  I want to use the "reveal-ck generate" command and I want to be able
  to insert text content into my slides

  Scenario: Inserting text content into haml slides from another file
    Given a file named "code/function.rb" with:
    """
    def two
      2
    end
    """
    Given a file named "slides.haml" with:
    """
    %section
      %pre
        %code= contents_of('code/function.rb')
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <pre><code>def two
    """
    And the file "slides/index.html" should contain:
    """
    <pre><code>def two
    """

  Scenario: Inserting text content into slim slides from another file
    Given a file named "code/function.rb" with:
    """
    def two
      2
    end
    """
    Given a file named "slides.slim" with:
    """
    section
      pre
        code== contents_of('code/function.rb')
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <pre><code>def two
    """
    And the file "slides/index.html" should contain:
    """
    <pre><code>def two
    """
