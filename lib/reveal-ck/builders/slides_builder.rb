require 'rake'

module RevealCK
  module Builders
    # Given a location of reveal.js files, reveal-ck files, and slides
    # file to work with, and a place to put it all.. this class
    # creates a presentation.
    class SlidesBuilder
      include Retrieve
      include RakeAware
      attr_reader :reveal_js_dir, :revealck_dir
      attr_reader :slides_file, :output_dir
      attr_reader :application
      def initialize(args)
        @reveal_js_dir = retrieve(:reveal_js_dir, args)
        @revealck_dir = retrieve(:revealck_dir, args)
        @output_dir = retrieve(:output_dir, args)
        @slides_file = retrieve(:slides_file, args)
        @application = Rake::Application.new
        @config = Config.new
        setup
      end

      def build
        application['create'].invoke
      end

      private

      def setup
        read_config
        task('create' => setup_dependencies)
      end

      def read_config
        config_file = File.join(@revealck_dir, 'config.yml')
        if File.exist?(config_file)
          config_as_hash = YAML.load_file config_file
          @config.merge!(config_as_hash)
        end
      end

      def setup_dependencies
        [setup_copy_user_files,
         setup_copy_reveal_js,
         setup_create_slides_html,
         setup_create_index_html]
      end

      def setup_copy_user_files
        task =
          CopyUserFiles.new(user_files_dir: revealck_dir,
                            output_dir: output_dir,
                            application: application)
        task.prepare
      end

      def setup_copy_reveal_js
        task =
          CopyRevealJs.new(reveal_js_dir: reveal_js_dir,
                           output_dir: output_dir,
                           application: application)
        task.prepare
      end

      def setup_create_slides_html
        task =
          CreateSlidesHtml.new(slides_file: slides_file,
                               config: @config,
                               output_dir: output_dir,
                               application: application)
        task.prepare
      end

      def setup_create_index_html
        index_html_erb = RevealCK.path_to('templates',
                                          'reveal.js',
                                          'index.html.erb')
        task =
          CreateIndexHtml.new(slides_html: "#{output_dir}/slides.html",
                              index_html: index_html_erb,
                              output_dir: output_dir,
                              config: @config,
                              application: application)
        task.prepare
      end
    end
  end
end
