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
        setup
        task(name => things_to_create.to_a)
      end

      def setup
        fail('setup must be implemented by subclasses')
      end

      def name
        fail('name must be implemented by subclasses')
      end
    end
  end
end
