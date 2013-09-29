require 'toml'

module RevealCK
  #
  # Public: The Config module supports the core metadata surrounding a
  # RevealCK Presentation: title, author, theme, and transition.
  #
  module Config

    def author
      @author || DEFAULTS['author']
    end

    def author=(author)
      @author = author
    end

    def title
      @title || DEFAULTS['title']
    end

    def title=(title)
      @title = title
    end

    def theme
      @theme || DEFAULTS['theme']
    end

    def theme=(theme)
      @theme = theme
    end

    def transition
      @transition || DEFAULTS['transition']
    end

    def transition=(transition)
      @transition = transition
    end

    DEFAULTS = {
      'title'      => 'Slides',
      'author'     => '',
      'theme'      => 'default',
      'transition' => 'default'
    }

    def merge_config(args)
      file = args[:file] || raise(':file is required')
      config = TOML.load_file file

      if config['author']
        @author = config['author'] unless @author
      end

      if config['title']
        @title = config['title'] unless @title
      end

      if config['presentation']
        presentation = config['presentation']
        if presentation['theme']
          @theme = presentation['theme'] unless @theme
        end

        if presentation['transition']
          @transition = presentation['transition'] unless @transition
        end
      end

    end

  end

end
