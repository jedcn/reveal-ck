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
        WebServer.new(doc_root, port).run
      end
    end

    class PrintBanner
      attr_reader :doc_root, :port, :slides_file
      def initialize(doc_root, port, slides_file)
        @doc_root, @port, @slides_file = doc_root, port, slides_file
      end
      def run
        puts
        puts "\tServing up slide content in '#{doc_root}/'."
        puts
        puts "\tOpen your browser to 'http://localhost:#{port}'."
        puts
        puts "\tPress CTRL-C to stop."
        puts
      end
    end

    class ListenToRebuildSlides
      require 'listen'

      def initialize(options)
        # TODO: Should include css/*.css, and config.yml
        listen_regex = /^slides\..+$/
        @listener = ::Listen.to('.', only: listen_regex) do |m, a, r|
          puts "modified absolute path: #{m}"
          puts "added absolute path: #{a}"
          puts "removed absolute path: #{r}"
          RevealCK::Commands::Generate.new(options).run
        end
      end

      def rebuild_slides

      end

      def run
        @listener.start
      end
    end
    class ListenToReloadBrowser
      require 'guard'
      def run
        guardfile = RevealCK.path('files/reveal-ck/Guardfile')
        Guard.start guardfile: guardfile
      end
    end

    class WebServer
      require 'rack'
      require 'webrick'
      require 'rack/livereload'
      attr_reader :server
      def initialize(doc_root, port)
        server_logger = WEBrick::BasicLog.new('reveal-ck-serve.log')
        access_log_file = File.open('reveal-ck-access.log', 'w')
        access_log = [[access_log_file, WEBrick::AccessLog::COMMON_LOG_FORMAT]]
        @server = Rack::Server.new(app: build_rack_app(doc_root),
                                  Port: port,
                                  Logger: server_logger,
                                  AccessLog: access_log)
      end

      def build_rack_app(doc_root)
        Rack::Builder.new do
          use Rack::LiveReload
          use Rack::Static, index: "#{doc_root}/index.html"
          run Rack::Directory.new(doc_root)
        end
      end

      def run
        server.start
      end
    end
  end
end
