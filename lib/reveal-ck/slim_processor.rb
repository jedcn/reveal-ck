require 'tilt'
require 'slim'

module RevealCK
  class SlimProcessor

    ::Slim::Engine.set_default_options pretty: true

    attr_reader :html

    def initialize(slim)
      template = Slim::Template.new {
        slim
      }
      @html = template.render
    end

    def self.open(path)
      slim_file = if File.exists? path
                    path
                  else
                    File.expand_path(File.join(Dir.pwd, path))
                  end
      slim = File.open(slim_file).read
      SlimProcessor.new slim
    end

  end
end
