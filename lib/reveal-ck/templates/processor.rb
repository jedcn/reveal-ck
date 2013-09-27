#
# Setup Slim
require 'slim'
::Slim::Engine.set_default_options pretty: true

module RevealCK
  module Templates
    #
    # Public: A Processor is given a template and expected to render
    # it.
    #
    class Processor

      require 'tilt'

      def initialize(file)
        @template = Tilt.new file
      end

      def output(scope = nil, locals = {})
        scope = RenderScope.new
        @template.render scope, locals
      end

      def self.open(file)
        Processor.new file
      end

    end

  end
end
