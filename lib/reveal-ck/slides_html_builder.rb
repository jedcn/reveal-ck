module RevealCK
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
