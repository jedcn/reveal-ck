module RevealCK
  #
  # Public: A Presentation is an ordered list of slides. It provides
  # access to the content of the slides on demand. It it also the
  # mechanism by which the slide "dsl" is defined and loaded into
  # being.
  #
  class Presentation

    attr_accessor :theme, :title, :author, :transition

    def initialize
      @slides = []
      @theme = 'default'
      @transition = 'default'
    end

    def add_slide(slide)
      @slides << slide
    end

    def content
      content = ''
      @slides.each do |slide|
        content << slide.html
        content << "\n\n"
      end
      content
    end

  end
end
