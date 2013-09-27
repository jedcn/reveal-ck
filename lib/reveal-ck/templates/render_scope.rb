module RevealCK
  module Templates
    #
    # Public: A new instance of RenderScope is created and made
    # available when templates are rendered. Instance methods on it
    # are availale to templates.
    #
    class RenderScope
      def contents_of(path)
        File.open(path).read
      end
    end
  end
end
