module RevealCK
  module Builders
    #
    # Public: A BuildTask couple a written description (in the form of a
    # string) with an action in (the form of a proc). It executes the
    # proc on demand via go!
    #
    class BuildTask

      def initialize(description, action)
        @description = description
        @action = action
      end

      def go
        @action.call
      end
    end

  end
end
