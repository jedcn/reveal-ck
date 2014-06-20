Feature: Slides with ERB

  reveal-ck can create a presentation using HTML and ERB.

  You should create a file named `slides.html.erb` where each slide is
  contained with a `<section>`. Then run `reveal-ck generate`.

  Your slides will be available at `slides/index.html`.

  If you'd like to see the intermediate file where your
  `slides.html.erb` is transformed into `.html` you can visit
  `slides/slides.html`

  Scenario: Generating basic slides using html
    Given a file named "slides.html.erb" with:
    """
    <section>
      <h1>Reveal.js</h1>
      <h3>HTML Presentations Made Easy</h3>
    </section>
    <% ['Fancy', 'Cats'].each do |word| %>
    <section>
      <h1><%= word %></h1>
    </section>
    <% end %>
    <section>
      <h1>THE END</h1>
    </section>
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.html.erb'..\n"
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should have html matching the xpath:
    | //section/h1[text()="Reveal.js"]                    | the opening h1    |
    | //section/h3[text()="HTML Presentations Made Easy"] | the opening h3    |
    | //section/h1[text()="Fancy"]                        | the evaluated erb |
    | //section/h1[text()="Cats"]                         | the evaluated erb |
    | //section/h1[text()="THE END"]                      | the closing h1    |
    And the file "slides/index.html" should have html matching the xpath:
    | //section/h1[text()="Reveal.js"]                    | the opening h1    |
    | //section/h3[text()="HTML Presentations Made Easy"] | the opening h3    |
    | //section/h1[text()="Fancy"]                        | the evaluated erb |
    | //section/h1[text()="Cats"]                         | the evaluated erb |
    | //section/h1[text()="THE END"]                      | the closing h1    |
