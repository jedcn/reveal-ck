module RevealCK
  class Presentation

    def initialize
      @slides = []
    end

    def add_slide(slide)
      @slides << slide
    end

    def content
      s = ""
      @slides.each do |slide|
        s << slide.html
        s << "\n\n"
      end
      s
    end

  end
end
