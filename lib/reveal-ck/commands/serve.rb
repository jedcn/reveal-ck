module RevealCK
  module Commands
    # This Command is responsible for implementing the idea behind
    # "reveal-ck serve."
    #
    # This includes taking an action and managing stdout
    class Serve
      include Retrieve
      attr_reader :doc_root, :port
      attr_reader :slides_file, :user_dir, :gem_dir, :output_dir
      def initialize(args)
        @doc_root    = retrieve(:doc_root, args)
        @port        = retrieve(:port, args)
        @slides_file = retrieve(:slides_file, args)
        @gem_dir     = retrieve(:gem_dir, args)
        @output_dir  = retrieve(:output_dir, args)
        @user_dir    = retrieve(:user_dir, args)
      end

      def run
        PrintBanner.new(doc_root, port, slides_file).run
        rebuild_options = {
          slides_file: slides_file,
          gem_dir: gem_dir,
          output_dir: output_dir,
          user_dir: user_dir
        }
        ListenToRebuildSlides.new(rebuild_options).run
        ListenToReloadBrowser.new.run
        StartWebServer.new(doc_root, port).run
      end
    end
  end
end
