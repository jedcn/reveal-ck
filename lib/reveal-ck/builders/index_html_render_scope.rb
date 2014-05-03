require 'rake'

module RevealCK
  module Builders
    # This class serves as the 'scope' that's present when
    # index.html.erb is being rendered.
    class IndexHtmlRenderScope
      include RequiredArg
      def initialize(args)
        @dir = retrieve(:dir, args)
      end

      def css_files
        things_in_css_dir = FileList["#{@dir}/css/**/*"]
        only_css_files = things_in_css_dir.grep(/\.css$/)
        relative_css_files = only_css_files.map do |file|
          file.sub("#{@dir}/", '')
        end
        relative_css_files
      end
    end
  end
end
