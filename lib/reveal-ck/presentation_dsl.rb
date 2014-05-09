module RevealCK
  #
  # Public: A PresentationDSL defines the DSL behind a
  # presentation. It also knows how to load file containing the DSL.
  #
  class PresentationDSL
    include RequiredArg
    attr_reader :author, :title, :theme, :transition

    def initialize(args)
      @slides = []
      @config = retrieve(:config, args)
    end

    # Rubocop doesn't like trivial accessors, but docile breaks if
    # trivial accessors are used.
    # rubocop:disable TrivialAccessors
    def theme(theme)
      @config.theme = theme
    end

    def transition(transition)
      @config.transition = transition
    end

    def title(title)
      @config.title = title
    end

    def author(author)
      @config.author = author
    end
    # rubocop:enable TrivialAccessors

    def revealjs_config(key, value)
      @config.revealjs_config[key] = value
    end

    def slide(template, variables = {})
      variables[:template] = template
      variables[:config] = @config
      @slides << RevealCK::Slide.new(variables)
    end

    def contents_of(path)
      File.open(path).read
    end

    def build
      presentation = RevealCK::Presentation.new config: @config
      presentation.theme = @theme if @theme
      presentation.transition = @transition if @transition
      presentation.author = @author if @author
      presentation.title = @title if @title
      @slides.each { |slide| presentation.add slide }
      presentation
    end

    require 'docile'

    def presentation(&block)
      Docile.dsl_eval(self, &block).build
    end

    def self.load(args)
      file = args[:file] || fail(':file is required')
      config = args[:config] || fail(':config is required')
      builder = PresentationDSL.new config: config
      contents = File.open(file).read
      builder.instance_eval(contents)
    end
  end
end
