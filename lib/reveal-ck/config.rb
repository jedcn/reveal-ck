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
      if config.author && config.author != DEFAULTS['author']
        @author = config.author
      end
      if config.title && config.title != DEFAULTS['title']
        @title = config.title
      end
      if config.theme && config.theme != DEFAULTS['theme']
        @theme = config.theme
      end
      if config.transition && config.transition != DEFAULTS['transition']
        @transition = config.transition
      end
    end
  end
end
