require 'rake'

module RevealCK
  module Builders
    class SlidesBuilder
      attr_reader :revealjs_dir, :revealck_dir
      attr_reader :slides_file, :output_dir
      attr_reader :application
      def initialize(args)
        @revealjs_dir = args[:revealjs_dir] || fail(':revealjs_dir is required')
        @revealck_dir = args[:revealck_dir] || fail(':revealck_dir is required')
        @output_dir   = args[:output_dir]   || fail(':output_dir is required')
        @slides_file  = args[:slides_file]  || fail(':slides_file is required')
        @application  = Rake::Application.new
      end

      def build
        copy_reveal_js = CopyRevealJs.new(revealjs_dir: revealjs_dir,
                                          output_dir: output_dir,
                                          application: application)
        copy_reveal_js.build
      end
    end
  end
end
