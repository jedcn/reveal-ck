require 'toml'

module RevealCK
  class Config

    def initialize(args={})
      config_file = args[:config_file]
      @config = load_config config_file
    end

    def title
      @config["title"]
    end

    def author
      @config["author"]
    end

    def theme
      @config["presentation"]["theme"]
    end

    private

    DEFAULTS = {
      "title" => "Slides",
      "author" => "Hakim El Hattab",
      "presentation" => {
        "theme" => "default"
      }
    }

    def load_config(config_file)
      config = DEFAULTS.dup
      if config_file && File.exists?(config_file)
        file_config = TOML.load_file config_file
        config.merge! file_config
      end
      config
    end

  end
end
