Feature: Slides with textile

  reveal-ck can create a presentation using [textile][redcloth].

  You should create a file named `slides.textile` where each slide is
  contained with a `<section>`. Then run `reveal-ck generate`.

  Your slides will be available at `slides/index.html`.

  If you'd like to see the intermediate file where your
  `slides.textile` is transformed into `.html` you can visit
  `slides/slides.html`

  [redcloth]: http://redcloth.org/

  Scenario: Generating basic slides using textile
    Given a file named "slides.textile" with:
    """
    <section>

    h1. Reveal.js

    h3. HTML Presentations Made Easy

    Created by "Hakim El Hattab":hakim / "@hakimel":twitter

    </section>

    <section>

    h1. THE END

    h3. BY Hakim El Hattab / hakim.se

    </section>

    [hakim]http://hakim.se
    [twitter]http://twitter.com/hakimel
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the output should contain exactly "Generating slides for 'slides.textile'..\n"
    And the following files should exist:
    | slides/slides.html |
    | slides/index.html  |
    And the file "slides/slides.html" should contain:
    """
    <section>
    <h1>Reveal.js</h1>
    <h3><span class="caps">HTML</span> Presentations Made Easy</h3>
    <p>Created by <a href="http://hakim.se">Hakim El Hattab</a> / <a href="http://twitter.com/hakimel">@hakimel</a></p>
    </section>
    <section>
    <h1><span class="caps">THE</span> <span class="caps">END</span></h1>
    <h3>BY Hakim El Hattab / hakim.se</h3>
    </section>
    """
    And the file "slides/index.html" should contain:
    """
    <section>
    <h1>Reveal.js</h1>
    <h3><span class="caps">HTML</span> Presentations Made Easy</h3>
    <p>Created by <a href="http://hakim.se">Hakim El Hattab</a> / <a href="http://twitter.com/hakimel">@hakimel</a></p>
    </section>
    <section>
    <h1><span class="caps">THE</span> <span class="caps">END</span></h1>
    <h3>BY Hakim El Hattab / hakim.se</h3>
    </section>
    """
