require 'rack'
require 'webrick'
require 'rack/livereload'

module RevealCK
  module Commands
    # The idea of starting up a webserver to display slides locally.
    class StartWebServer
      attr_reader :doc_root, :port
      def initialize(doc_root, port)
        @doc_root, @port = doc_root, port
      end

      def run
        Rack::Server.new(app: build_rack_app(doc_root),
                         Port: port,
                         Logger: server_log,
                         AccessLog: access_log).start
      end

      private

      def build_rack_app(doc_root)
        Rack::Builder.new do
          use Rack::LiveReload
          use Rack::Static, index: "#{doc_root}/index.html"
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
