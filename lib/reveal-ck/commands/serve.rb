module RevealCK
  module Commands
    # This Command is responsible for implementing the idea behind
    # "reveal-ck serve."
    #
    # This includes taking an action and managing stdout
    class Serve
      include Retrieve
      attr_reader :doc_root, :port, :host
      attr_reader :slides_file, :user_dir, :gem_dir, :output_dir
      attr_reader :ui
      def initialize(args)
        @doc_root    = retrieve(:doc_root, args)
        @port        = retrieve(:port, args)
        @host        = retrieve(:host, args)
        @slides_file = retrieve(:slides_file, args)
        @gem_dir     = retrieve(:gem_dir, args)
        @output_dir  = retrieve(:output_dir, args)
        @user_dir    = retrieve(:user_dir, args)
        @ui          = ServeUI.new
      end

      def run
        print_banner
        listen_to_reload
        listen_to_rebuild
        start_web_server
      end

      def rebuild_slides
        RevealCK::Commands::Generate.new(rebuild_options).run
      rescue => error
        ui.problem('Failed to Generate Slides:', error)
      end

      private

      def print_banner
        PrintBanner.new(doc_root, port, host, slides_file, ui).run
      end

      def listen_to_reload
        ui.message('Getting Ready to Reload Browsers.')
        ListenToReloadBrowser.new(ui, output_dir).run
      end

      def listen_to_rebuild
        ui.message('Getting Ready to Rebuild Slides.')
        ListenToRebuildSlides.new(ui, output_dir) do
          rebuild_slides
        end.run
      end

      def start_web_server
        ui.message('Starting Webserver.')
        StartWebServer.new(doc_root, port, host).run
      end

      def rebuild_options
        {
          slides_file: @slides_file,
          gem_dir: @gem_dir,
          output_dir: @output_dir,
          user_dir: @user_dir,
          stdout_prefix: ui.prefix_for(:rebuild)
        }
      end
    end
  end
end
