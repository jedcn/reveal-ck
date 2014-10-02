require 'rack'
require 'webrick'
require 'rack/livereload'

module RevealCK
  module Commands
    # The idea of starting up a webserver to display slides locally.
    class StartWebServer
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
