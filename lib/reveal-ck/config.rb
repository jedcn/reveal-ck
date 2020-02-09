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
        self[name] = value
      end
    end

    def defaults
      [core_defaults,
       revealjs_config_defaults,
       filter_defaults].reduce({}) { |acc, elem| acc.merge(elem) }
    end

    OPEN_GRAPH_PREFIX =
      'og: http://ogp.me/ns# ' \
      'fb: http://ogp.me/ns/fb# ' \
      'article: http://ogp.me/ns/article#'.freeze

    def core_defaults
      {
        'title' => 'Slides',
        'description' => '',
        'author' => '',
        'theme' => 'black',
        'transition' => 'default',
        'data' => {},
        'meta_properties' => {},
        'meta_names' => {},
        'head_prefix' => OPEN_GRAPH_PREFIX
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
        'asset_root' => 'https://github.githubassets.com/images/icons/',
        'base_url' => 'https://github.com',
        'requires' => []
      }
    end
  end
end
