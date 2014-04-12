Feature: How to store and reference images

  You can use two schemes for including images in your presentations.

  Absolutely: you can let the images be external to your presentation
  and reference them absolutely.

  Relatively: you can bundle your images in with your presentation and
  reference them relatiely. If you choose this route, put any images
  in the `images/` directory. Then reference them as
  `images/image_name.ext`.

  Any files placed into the `images/` directory will be copied into
  the presentation at slides.

  Scenario: Generating slides that reference my images
    Given a file named "images/ruby100.png" that's a copy of "data/images/ruby100.png"
    And a file named "slides.haml" with:
    """
    %section
      %img{ alt: 'Ruby Logo', src: 'images/ruby100.png' }
    """
    When I run `reveal-ck generate`
    Then the exit status should be 0
    And the following files should exist:
    | slides/slides.html        |
    | slides/index.html         |
    | slides/images/ruby100.png |
    And the file "slides/index.html" should contain:
    """
    <section>
      <img alt='Ruby Logo' src='images/ruby100.png'>
    </section>
    """
