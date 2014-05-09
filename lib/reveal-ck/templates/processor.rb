#
# Setup Slim
require 'slim'
::Slim::Engine.set_default_options pretty: true

require 'tilt'

module RevealCK
  module Templates
    # Public: A Processor is given a template and expected to render
    # it.
    class Processor
      include RequiredArg

      attr_reader :config

      def initialize(args)
        file = retrieve(:file, args)
        @config = retrieve(:config, args)
        @template = Tilt.new file
      end

      def output(locals = {})
        scope = RevealCK::Render::Scope.new(dir: Dir.pwd, config: config)
        @template.render scope, locals
      end

      def self.open(args)
        file = args[:file] || fail(':file is required')
        config = args[:config] || fail(':config is required')
        Processor.new(file: file, config: config)
      end
    end
  end
end
