module RevealCK
  module Builders
    # Works within the context of Rake to setup a task for a given
    # name
    class CreationTask
      include Retrieve
      include RakeAware
      attr_reader :application, :things_to_create

      def initialize(args)
        @application = retrieve(:application, args)
        @things_to_create = Set.new
      end

      def setup
        fail('setup must be implemented by subclasses')
      end

      def name
        full_class_name = self.class.to_s
        class_name = full_class_name.gsub(/.*::/, '')
        add_underscores = class_name.gsub(/([A-Z])/, '_\1')
        trim_first_underscore = add_underscores[1..add_underscores.size]
        trim_first_underscore.downcase
      end

      def prepare
        setup
        task(name => things_to_create.to_a)
        name
      end
    end
  end
end
