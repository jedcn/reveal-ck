require 'rake'

module RevealCK
  module Builders
    # This class serves as the 'scope' that's present when
    # index.html.erb is being rendered.
    class IndexHtmlRenderScope
      include RevealCK::Render::CssFiles
      include RequiredArg
      def initialize(args)
        @dir = retrieve(:dir, args)
      end
    end
  end
end
