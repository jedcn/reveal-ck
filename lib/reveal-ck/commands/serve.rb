module RevealCK
  module Commands
    # This Command is responsible for implementing the idea behind
    # "reveal-ck serve."
    #
    # This includes taking an action and managing stdout
    class Serve
      include Retrieve
      attr_reader :generate_args, :slides_file, :dir, :port
      def initialize(args)
        @dir = retrieve(:dir, args)
        @port = retrieve(:port, args)
        @slides_file = retrieve(:slides_file, args)
        @generate_args = {
          gem_dir: retrieve(:gem_dir, args),
          output_dir: retrieve(:output_dir, args),
          slides_file: slides_file,
          user_dir: retrieve(:user_dir, args)
        }
      end

      def run
        print_helpful_banner
        listen_to_rebuild_slides
        listen_to_reload_browser
        start_webserver
      end

      private

      def print_helpful_banner
        puts
        puts "\tServing up slide content in '#{dir}/'."
        puts
        puts "\tOpen your browser to 'http://localhost:#{port}'."
        puts
        puts "\tChanges to #{slides_file} should automatically reload."
        puts
        puts "\tPress CTRL-C to stop."
        puts
      end

      def listen_to_rebuild_slides
        # TODO: Should include css/*.css, and config.yml
        listen_regex = /^slides\..+$/
        require 'listen'
        listener = ::Listen.to('.', only: listen_regex) do |m, a, r|
          puts "modified absolute path: #{m}"
          puts "added absolute path: #{a}"
          puts "removed absolute path: #{r}"
          rebuild_slides
        end
        listener.start
      end

      def rebuild_slides
        RevealCK::Commands::Generate.new(generate_args).run
      end

      def listen_to_reload_browser
        require 'guard'
        guardfile = RevealCK.path('files/reveal-ck/Guardfile')
        Guard.start guardfile: guardfile
      end

      def start_webserver
        require 'rack'
        require 'webrick'
        server_logger = WEBrick::BasicLog.new('reveal-ck-serve.log')
        access_log_file = File.open('reveal-ck-access.log', 'w')
        access_log = [[access_log_file, WEBrick::AccessLog::COMMON_LOG_FORMAT]]
        server = Rack::Server.new(app: build_rack_app,
                                  Port: port,
                                  Logger: server_logger,
                                  AccessLog: access_log)
        server.start
      end

      def build_rack_app
        require 'rack/livereload'
        doc_root = dir
        Rack::Builder.new do
          use Rack::LiveReload
          use Rack::Static, index: "#{doc_root}/index.html"
          run Rack::Directory.new(doc_root)
        end
      end
    end
  end
end
