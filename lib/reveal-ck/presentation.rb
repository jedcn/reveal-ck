module RevealCK
  class Presentation

    attr_accessor :theme, :title, :author

    def initialize
      @slides = []
      @theme = 'default'
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

module RevealCK
  class Presentation

    def self.load(file)
      presentation = Presentation.new
      content = File.open(file).read
      presentation.eval content
      presentation
    end

    def eval(s)
      instance_eval s
    end

    def slide(template, variables)
      variables[:template] = template
      add_slide(Slide.new(variables))
    end

  end
end
