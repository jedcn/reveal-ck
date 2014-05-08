module RevealCK
  module Render
    # A Scope provides methods available at render time.
    class Scope
      include RequiredArg
      include ContentsOf
      include CssFiles
      def initialize(args)
        @dir = retrieve(:dir, args)
      end
    end
  end
end
