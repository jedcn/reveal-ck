module RevealCK
  module Render
    # Determine which js files are in the plugin dir
    module PluginFiles
      def plugin_files
        things_in_plugin_dir = FileList["#{@dir}/plugin/**/*"]
        only_js_files = things_in_plugin_dir.grep(/\.js$/)
        relative_plugin_files = only_js_files.map do |file|
          file.sub("#{@dir}/", '')
        end
        relative_plugin_files
      end
    end
  end
end
