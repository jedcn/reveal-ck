require 'tilt/haml'

module RevealCK
  class HamlProcessor

    attr_reader :html

    def initialize(haml)
      template = Tilt::HamlTemplate.new {
        haml
      }
      @html = template.render
    end

    def self.open(path)
      haml_file = if File.exists? path
                    path
                  else
                    File.expand_path(File.join(Dir.pwd, path))
                  end
      haml = File.open(haml_file).read
      HamlProcessor.new haml
    end

  end
end
