module RevealCK
  # A Config represents core configuration options within
  # reveal-ck. It has defaults. It is mutable.
  class Config
    attr_writer :author, :title, :theme, :transition

    def initialize
      @values = {}.merge(DEFAULTS)
    end

    def author
      @values['author']
    end

    def author=(value)
      @values['author'] = value
    end

    def title
      @values['title']
    end

    def title=(value)
      @values['title'] = value
    end

    def theme
      @values['theme']
    end

    def theme=(value)
      @values['theme'] = value
    end

    def transition
      @values['transition']
    end

    def transition=(value)
      @values['transition'] = value
    end

    def merge!(hash)
      @values.merge!(hash)
    end

    def to_h
      @values.dup
    end

    DEFAULTS = {
      'title'      => 'Slides',
      'author'     => '',
      'theme'      => 'default',
      'transition' => 'default'
    }
  end
end
