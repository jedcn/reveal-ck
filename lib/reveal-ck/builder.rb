module RevealCK
  #
  # Public: A Builder knows how to execute BuildTasks. These are added
  # via add_task, and executed via build!
  #
  # It is expected to be subclassed, and the subclass must override
  # register_tasks.
  #
  class Builder

    def register_tasks
      raise "Subclasses must implement register_tasks"
    end

    def add_task(description, action)
      @tasks << BuildTask.new({
                                description: description,
                                action: action
                              })
    end

    def build!
      register_tasks unless @tasks
      @tasks.each {|task| task.go!}
    end

  end
end
