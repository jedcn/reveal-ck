module RevealCK
  module Builders
    # Given a slides_file, a Rake application, and a place where the
    # transformed slides file should end up, this class knows how to
    # work with Rake and create the slides.html.
    class CreateSlidesHtml < CreationTask
      attr_reader :slides_file, :output_dir, :config

      def initialize(args)
        @slides_file = retrieve(:slides_file, args)
        @output_dir = retrieve(:output_dir, args)
        @config = retrieve(:config, args)
        super
      end

      def setup
        slides_html_file = "#{output_dir}/slides.html"
        task(slides_html_file) do
          presentation = RevealCK::Presentation.load(file: slides_file,
                                                     config: config)
          File.open(slides_html_file, 'w') do |slides_html|
            slides_html.puts(presentation.html)
          end
        end
        things_to_create.add(slides_html_file)
      end
    end
  end
end
