module RevealCK
  #
  # Public: A Slide produces HTML output to be included in a
  # presentation. Presently, this output is based upon a template.
  #
  class Slide

    def initialize(args)
      template = args[:template] || raise(':template is required')
      file = TemplateFinder.new.find template
      @template = TemplateProcessor.open file
      @variables = args
    end

    def output
      @template.output({}, @variables)
    end

  end
end
