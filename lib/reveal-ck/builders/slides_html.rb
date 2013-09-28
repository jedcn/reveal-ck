module RevealCK
  module Builders
    #
    # Public: A SlidesHtml knows how to create the intermediate file
    # slides.html. This file is a users generate slide content, and is
    # ultimately inserted within reveal.js.
    #
    # A slides.html can be created from a template or from an instance
    # of a Presentation.
    #
    class SlidesHtml

      def initialize(args)
        @input_file = args[:input_file]
        @presentation = args[:presentation]
        missing_info = 'either :input_file or :presentation are required'
        raise missing_info unless @input_file || @presentation
      end

      def render
        if @input_file
          if @input_file.end_with? '.rb'
            presentation = RevealCK::PresentationDSL.load @input_file
            presentation.content
          else
            template = Templates::Processor.open @input_file
            template.output({})
          end
        else
          @presentation.content
        end
      end

      def write_to(args)
        file = args[:file] || raise(':file is required')
        File.open(file, 'w') { |file| file << render }
      end

    end
  end
end
