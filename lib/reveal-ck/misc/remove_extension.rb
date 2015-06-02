module RevealCK
  module Misc
    # Knows how to remove an extension from a filename
    module RemoveExtension
      def remove_extension(file_name)
        file_name.sub(%r{\.[^/]*\z}, '')
      end
    end
  end
end
