module RevealCK
  #
  # Public: A Presentation is slide html and metadata. Access html via
  # #html. Access metadata via theme, title, author, transition.
  #
  class Presentation
    include RequiredArg
    extend Forwardable
    [:author, :title, :transition, :theme].each do |name|
      def_delegators :@config, name, "#{name}=".to_sym
    end

    def revealjs_config
      @config.revealjs_config
    end

    attr_accessor :html, :config

    def initialize(args)
      @html = ''
      @config = retrieve(:config, args)
    end

    def add(content)
      @html << content.html
    end

    def self.from_template(args)
      file = args[:file] || fail(':file is required')
      config = args[:config] || fail(':config is required')
      presentation = Presentation.new config: config
      template = Templates::Processor.open file
      presentation.html = template.output({})
      presentation
    end

    def self.from_dsl(args)
      file = args[:file] || fail(':file is required')
      config = args[:config] || fail(':config is required')
      RevealCK::PresentationDSL.load file: file, config: config
    end

    def self.load(args)
      file = args[:file] || fail(':file is required')
      config = args[:config] || fail(':config is required')
      if file.end_with? '.rb'
        Presentation.from_dsl file: file, config: config
      else
        Presentation.from_template file: file, config: config
      end
    end
  end
end
