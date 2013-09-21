module RevealCK
  #
  # Public: A BuildTask couple a written description (in the form of a
  # string) with an action in (the form of a proc). It executes the
  # proc on demand via go!
  #
  class BuildTask

    def initialize(args)
      @description = args[:description]
      @action = args[:action]
    end

    def go!
      @action.call
    end
  end

end
