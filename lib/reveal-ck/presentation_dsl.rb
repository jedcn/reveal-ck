module RevealCK
  #
  # Public: A PresentationDSL defines the DSL behind a
  # presentation. It also knows how to load file containing the DSL.
  #
  class PresentationDSL

    def initialize
      @slides = []
    end

    def theme(theme = 'default')
      @theme = theme
    end

    def transition(transition = 'default')
      @transition = transition
    end

    def title(title = 'Slides')
      @title = title
    end

    def author(author = '')
      @author = author
    end

    def slide(template, variables)
      variables[:template] = template
      @slides << RevealCK::Slide.new(variables)
    end

    def build
      presentation = RevealCK::Presentation.new
      presentation.theme = @theme
      presentation.transition = @transition
      presentation.author = @author
      presentation.title = @title
      @slides.each do |slide|
        presentation.add_slide slide
      end
      presentation
    end

    require 'docile'

    def presentation(&block)
      Docile.dsl_eval(PresentationDSL.new, &block).build
    end

    def self.load(file)
      builder = PresentationDSL.new
      contents = File.open(file).read
      result = builder.instance_eval contents
      result
    end

  end
end
