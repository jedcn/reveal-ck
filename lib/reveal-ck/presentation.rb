module RevealCK
  #
  # Public: A Presentation is slide html and metadata. Access html via
  # #html. Access metadata via theme, title, author, transition.
  #
  class Presentation
    include Config

    attr_accessor :html

    def initialize
      @html = ''
    end

    def add(content)
      @html << content.html
    end

    def self.from_template(path)
      presentation = Presentation.new
      template = Templates::Processor.open path
      presentation.html = template.output({})
      presentation
    end

    def self.from_dsl(path)
      RevealCK::PresentationDSL.load path
    end

    def self.load(path)
      if path.end_with? '.rb'
        Presentation.from_dsl path
      else
        Presentation.from_template path
      end
    end
  end
end
