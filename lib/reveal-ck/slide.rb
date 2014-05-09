module RevealCK
  #
  # Public: A Slide produces HTML output to be included in a
  # presentation. Presently, this output is based upon a template.
  #
  class Slide
    def initialize(args)
      template = args[:template] || fail(':template is required')
      config = args[:config] || {}
      file = Templates::Finder.new.find template
      @template = Templates::Processor.open(file: file, config: config)
      @variables = args
    end

    def html
      @template.output(@variables)
    end
  end
end
