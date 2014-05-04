require 'ostruct'

module RevealCK
  # A Config represents core configuration options within
  # reveal-ck. It has defaults. It is mutable.
  class Config < OpenStruct
    def initialize
      super DEFAULTS
    end

    def merge!(hash)
      hash.each_pair do |key, value|
        self[key.to_sym] = value
      end
    end

    DEFAULTS = {
      'title'      => 'Slides',
      'author'     => '',
      'theme'      => 'default',
      'transition' => 'default'
    }
  end
end
