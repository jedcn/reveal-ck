module RevealCK
  module Render
    # Determine which .js files are underneath a @dir
    module JsFiles
      def js_files
        things_in_js_dir = FileList["#{@dir}/js/**/*"]
        only_js_files = things_in_js_dir.grep(/\.js$/)
        only_js_files.map do |file|
          file.sub("#{@dir}/", '')
        end
      end
    end
  end
end
