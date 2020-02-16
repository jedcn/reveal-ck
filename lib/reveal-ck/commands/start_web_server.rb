require 'rack'
require 'webrick'
require 'rack/livereload'

module RevealCK
  module Commands
    # The idea of starting up a webserver to display slides locally.
    class StartWebServer
      attr_reader :doc_root, :port, :host
      def initialize(doc_root, port, host)
        @doc_root = doc_root
        @port = port
        @host = host
      end

      def run
        Rack::Server.new(app: build_rack_app(doc_root),
                         Host: host,
                         Port: port,
                         Logger: server_log,
                         DoNotReverseLookup: true,
                         AccessLog: access_log).start
      end

      private

      def build_rack_app(doc_root)
        Rack::Builder.new do
          use Rack::LiveReload
          use Rack::Static, urls: { '/' => 'index.html' }, root: doc_root
          run Rack::Directory.new(doc_root)
        end
      end

      def server_log
        WEBrick::BasicLog.new(temp_log('reveal-ck-server'))
      end

      def access_log
        access_log_file = File.open(temp_log('reveal-ck-access'), 'w')
        [[access_log_file, WEBrick::AccessLog::COMMON_LOG_FORMAT]]
      end

      def temp_log(name)
        require 'tempfile'
        file = Tempfile.new(["#{name}-", '.log'])
        file.path
      end
    end
  end
end
