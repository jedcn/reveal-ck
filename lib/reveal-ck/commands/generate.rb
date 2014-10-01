module RevealCK
  module Commands
    # This Command is responsible for implementing the idea behind
    # "reveal-ck generate."
    #
    # This includes taking an action and managing stdout
    class Generate
      include Retrieve
      attr_reader :slides_builder, :slides_file
      def initialize(args)
        user_dir = retrieve(:user_dir, args)
        gem_dir = retrieve(:gem_dir, args)
        output_dir = retrieve(:output_dir, args)
        @slides_file = retrieve(:slides_file, args)
        @slides_builder =
          RevealCK::Builders::SlidesBuilder.new(user_dir: user_dir,
                                                gem_dir: gem_dir,
                                                output_dir: output_dir,
                                                slides_file: slides_file)
      end

      def run
        puts "Generating slides for '#{slides_file}'.."
        slides_builder.prepare
        slides_builder.build
      end
    end
  end
end
