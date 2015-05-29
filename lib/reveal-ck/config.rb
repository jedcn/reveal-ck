require 'ostruct'

module RevealCK
  # A Config represents core configuration options within
  # reveal-ck. It has defaults. It is mutable.
  class Config < OpenStruct
    def initialize
      super defaults
    end

    def merge!(hash)
      hash.each_pair do |name, value|
        modifiable[new_ostruct_member(name)] = value
      end
    end

    def defaults
      [core_defaults,
       revealjs_config_defaults,
       filter_defaults].reduce({}) { |a, e| a.merge(e) }
    end

    def core_defaults
      {
        'title'       => 'Slides',
        'description' => '',
        'author'      => '',
        'theme'       => 'black',
        'transition'  => 'default',
        'data' => {

        }
      }
    end

    def revealjs_config_defaults
      {
        'revealjs_config' => {
          'controls' => true,
          'progress' => true,
          'history' => true,
          'center' => true
        }
      }
    end

    def filter_defaults
      {
        'filters' => ['HTML::Pipeline::RevealCKEmojiFilter',
                      'HTML::Pipeline::MentionFilter',
                      'HTML::Pipeline::AutolinkFilter'],
        'asset_root' => 'https://assets-cdn.github.com/images/icons/',
        'base_url' => 'https://github.com',
        'requires' => []
      }
    end
  end
end
