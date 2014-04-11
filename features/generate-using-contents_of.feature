Feature: Inserting files into slides with contents_of

  reveal-ck allows you to insert the contents of a file into your
  slides.

  This can be helpful when you'd like to insert a code snippet into
  your slides and you'd like to keep the code snippet in a distinct
  file.

  reveal-ck makes a helper function named `contents_of` available for
  this purpose. This function expects a single argument that names the
  location of the file to be included.

  The file that's included should be named relative to the slides
  file. The examples below always place the file to be included in the
  `code/` directory, but there's nothing special about that directory.

  This content will be inlined into your presentation at
  `slides/index.html`.

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

  Scenario: Inserting text content into ruby slides from another file
    Given a file named "code/function.rb" with:
    """
    def two
      2
    end
    """
    Given a file named "slides.rb" with:
    """
    presentation do
      slide('code', content: contents_of('code/function.rb'))
    end
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <pre><code contenteditable="" data-trim="">def two
    """
    And the file "slides/index.html" should contain:
    """
    <pre><code contenteditable="" data-trim="">def two
    """
