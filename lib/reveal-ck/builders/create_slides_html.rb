module RevealCK
  module Builders
    # Given a slides_file, a Rake application, and a place where the
    # transformed slides file should end up, this class knows how to
    # work with Rake and create the slides.html.
    class CreateSlidesHtml
      require 'rake'

      attr_reader :slides_file, :output_dir, :config_file
      attr_reader :application

      def initialize(args)
        @slides_file = args[:slides_file] || fail(':slides_file is required')
        @output_dir  = args[:output_dir]  || fail(':output_dir is required')
        @application = args[:application] || fail(':application is required')
        @config_file = args[:config_file] || fail(':config_file is required')
        setup
      end

      private

      def setup
        slides_html_file = "#{output_dir}/slides.html"
        application.define_task(Rake::Task, slides_html_file) do
          presentation = RevealCK::Presentation.load slides_file
          presentation.merge_config(file: config_file) if File.exists?(config_file)
          File.open(slides_html_file, 'w') do |slides_html|
            slides_html.puts(presentation.html)
          end
        end
        application.define_task(Rake::Task, 'create_slides_html' => slides_html_file)
      end
    end
  end
end
