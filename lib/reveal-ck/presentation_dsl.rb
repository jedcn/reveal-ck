module RevealCK
  #
  # Public: A PresentationDSL defines the DSL behind a
  # presentation. It also knows how to load file containing the DSL.
  #
  class PresentationDSL

    attr_reader :author, :title, :theme, :transition

    def initialize
      @slides = []
      @theme = 'default'
      @transition = 'default'
      @title = 'Slides'
      @author = ''
    end

    def theme(theme)
      @theme = theme
    end

    def transition(transition)
      @transition = transition
    end

    def title(title)
      @title = title
    end

    def author(author)
      @author = author
    end

    def slide(template, variables = {})
      variables[:template] = template
      @slides << RevealCK::Slide.new(variables)
    end

    def contents_of(path)
      File.open(path).read
    end

    def build
      presentation = RevealCK::Presentation.new
      presentation.theme = @theme
      presentation.transition = @transition
      presentation.author = @author
      presentation.title = @title
      @slides.each { |slide| presentation.add slide }
      presentation
    end

    require 'docile'

    def presentation(&block)
      Docile.dsl_eval(PresentationDSL.new, &block).build
    end

    def self.load(file)
      builder = PresentationDSL.new
      contents = File.open(file).read
      builder.instance_eval(contents)
    end

  end
end
