require 'haml'
require 'ostruct'

class HamlProcessor

  attr_reader :html

  def initialize(haml)
    render_context = ::OpenStruct.new({})
    engine = ::Haml::Engine.new haml
    @html = engine.render render_context
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
