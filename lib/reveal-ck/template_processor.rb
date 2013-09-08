#
# Setup Slim
require 'slim'
::Slim::Engine.set_default_options pretty: true

module RevealCK
  class TemplateProcessor

    require 'tilt'

    def initialize(file)
      @template = Tilt.new file
    end

    def output(scope={}, locals = {})
      @template.render scope, locals
    end

    def self.open(path)
      file = if File.exists? path
               path
             else
               File.expand_path(File.join(Dir.pwd, path))
             end
      TemplateProcessor.new file
    end

  end
end
