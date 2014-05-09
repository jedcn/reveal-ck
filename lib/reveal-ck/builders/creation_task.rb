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
        fail('Must be implemented')
      end

      def name
        fail('Must be implemented')
      end
    end
  end
end
