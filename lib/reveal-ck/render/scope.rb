module RevealCK
  module Render
    # A Scope provides methods available at render time.
    class Scope
      include Retrieve
      include ContentsOf
      include CssFiles
      include JsFiles
      include PluginFiles
      include IndexHtmlMaker

      attr_reader :config

      def initialize(args)
        @dir = retrieve(:dir, args)
        @config = retrieve(:config, args)
      end
    end
  end
end
