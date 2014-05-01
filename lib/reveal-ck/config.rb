require 'yaml'

module RevealCK
  #
  # Public: The Config module supports the core metadata surrounding a
  # RevealCK Presentation: title, author, theme, and transition.
  #
  module Config
    attr_writer :author, :title, :theme, :transition

    def author
      @author || DEFAULTS['author']
    end

    def title
      @title || DEFAULTS['title']
    end

    def theme
      @theme || DEFAULTS['theme']
    end

    def transition
      @transition || DEFAULTS['transition']
    end

    DEFAULTS = {
      'title'      => 'Slides',
      'author'     => '',
      'theme'      => 'default',
      'transition' => 'default'
    }

    def from_file(args)
      file = args[:file] || fail(':file is required')
      config = YAML.load_file file
      @author = config['author']
      @title = config['title']
      @theme = config['theme']
      @transition = config['transition']
    end

    def merge(config)
      set_value_if_not_default(config, 'author')
      set_value_if_not_default(config, 'title')
      set_value_if_not_default(config, 'theme')
      set_value_if_not_default(config, 'transition')
    end

    private

    def set_value_if_not_default(config, name)
      value = config.send(name)
      send("#{name}=", value) unless value == DEFAULTS[name]
    end
  end
end
