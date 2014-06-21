require 'rake'

module RevealCK
  module Builders
    # This class knows which files from reveal-ck are vital to the
    # presentation.
    class RevealCkFiles
      include Retrieve

      attr_reader :dir

      def initialize(args)
        @dir = retrieve(:dir, args)
      end

      def files
        FileList["#{dir}/css/reveal-ck.css"]
      end
    end
  end
end
