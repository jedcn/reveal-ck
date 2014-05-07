module RevealCK
  module Render
    # A Scope provides methods available at render time.
    class Scope
      def contents_of(path)
        File.open(path).read
      end
    end
  end
end
