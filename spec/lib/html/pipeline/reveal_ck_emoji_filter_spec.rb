require 'spec_helper'

module HTML
  class Pipeline
    describe RevealCKEmojiFilter do
      let :emoji_filter do
        doc = nil
        context = {
          asset_root: 'asset_root'
        }
        RevealCKEmojiFilter.new doc, context
      end

      it 'works with defined emoji' do
        expected = "I <img class='emoji' title=':heart:' "
        expected += "alt=':heart:' src='asset_root/emoji/unicode/2764.png' "
        expected += "align='absmiddle' /> emoji"
        result = emoji_filter.emoji_image_filter('I :heart: emoji')
        expect(result).to eq(expected)
      end

      it 'leaves undefined emoji alone' do
        result = emoji_filter.emoji_image_filter('I :dont_know: emoji')
        expect(result).to eq('I :dont_know: emoji')
      end
    end
  end
end
