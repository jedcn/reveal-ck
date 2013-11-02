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

    def merge_config(args)
      file = args[:file] || raise(':file is required')
      config = YAML.load_file file

      @author     = @author     || config['author']
      @title      = @title      || config['title']
      @theme      = @theme      || config['theme']
      @transition = @transition || config['transition']
    end

  end

end
