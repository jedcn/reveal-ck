module RevealCK
  module Render
    # Determine which .css files are underneath a @dir
    module CssFiles
      def css_files
        things_in_css_dir = FileList["#{@dir}/css/**/*"]
        only_css_files = things_in_css_dir.grep(/\.css$/)
        only_css_files.map do |file|
          file.sub("#{@dir}/", '')
        end
      end
    end
  end
end
