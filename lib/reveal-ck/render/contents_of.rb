module RevealCK
  module Render
    # Provides mechanism to inline a file
    module ContentsOf
      def contents_of(path)
        File.open(path).read
      end
    end
  end
end
