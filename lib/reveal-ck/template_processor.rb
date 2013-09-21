#
# Setup Slim
require 'slim'
::Slim::Engine.set_default_options pretty: true

module RevealCK
  #
  # Public: A TemplateProcessor is given a template and expected to
  # render it.
  #
  class TemplateProcessor

    require 'tilt'

    def initialize(file)
      @template = Tilt.new file
    end

    def output(scope=nil, locals = {})
      @template.render scope, locals
    end

    def self.open(file)
      TemplateProcessor.new file
    end

  end
end
