module RevealCK
  module Commands
    # The idea of displaying a banner via an injected ui. Messages
    # sent explain everything to do with the serve command (listening,
    # reloading, and webserving)
    class PrintBanner
      attr_reader :doc_root, :port, :slides_file, :ui
      def initialize(doc_root, port, slides_file, ui)
        @doc_root = doc_root
        @port = port
        @slides_file = slides_file
        @ui = ui
      end

      def run
        ui.separator
        ui.message "Serving up slide content in '#{doc_root}/'."
        ui.message "Open your browser to 'http://localhost:#{port}'."
        ui.message 'Press CTRL-C to stop.'
        ui.separator
      end
    end
  end
end
