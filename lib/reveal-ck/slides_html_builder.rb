module RevealCK
  #
  # Public: A SlidesHtmlBuilder knows how to create the intermediate
  # file slides.html. This file is a users generate slide content, and
  # is ultimately inserted within reveal.js.
  #
  # A slides.html can be created from a template or from an instance
  # of a Presentation.
  #
  class SlidesHtmlBuilder

    def initialize(args)
      @input_file = args[:input_file]
      @presentation = args[:presentation]
      raise 'either :input_file or :presentation are required' unless @input_file || @presentation
    end

    def render
      if @input_file
        if @input_file.end_with? '.rb'
          presentation = RevealCK::Presentation.load @input_file
          presentation.content
        else
          template = TemplateProcessor.open @input_file
          template.output({}, {})
        end
      else
        @presentation.content
      end
    end

    def write_to(args)
      file = args[:file] || raise(':file is required')
      File.open(file, 'w') { |f| f << render }
    end

  end
end
