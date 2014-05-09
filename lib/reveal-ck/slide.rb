module RevealCK
  #
  # Public: A Slide produces HTML output to be included in a
  # presentation. Presently, this output is based upon a template.
  #
  class Slide
    include Retrieve
    def initialize(args)
      template = retrieve(:template, args)
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
