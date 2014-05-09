module RevealCK
  module Render
    # A Scope provides methods available at render time.
    class Scope
      attr_reader :config
      include RequiredArg
      include ContentsOf
      include CssFiles
      include IndexHtmlMaker

      def initialize(args)
        @dir = retrieve(:dir, args)
        @config = retrieve(:config, args)
      end
    end
  end
end
