require 'ostruct'
require 'json'

module RevealCK
  # A Config represents core configuration options within
  # reveal-ck. It has defaults. It is mutable.
  class Config < OpenStruct
    def initialize
      super DEFAULTS
    end

    def merge!(hash)
      hash.each_pair do |name, value|
        modifiable[new_ostruct_member(name)] = value
      end
    end

    DEFAULTS = {
      'title'      => 'Slides',
      'author'     => '',
      'theme'      => 'default',
      'transition' => 'default',
      'revealjs_config' => {
        'controls' => true,
        'progress' => true,
        'history' => true,
        'center' => true
      },
      'data' => {

      }
    }
  end
end