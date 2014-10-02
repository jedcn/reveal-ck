module RevealCK
  module Commands
    # The idea of printing a banner to the stdout explaining
    # everything to do with the serve command (listening, reloading,
    # and webserving)
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
  end
end
