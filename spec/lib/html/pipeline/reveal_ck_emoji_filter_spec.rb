require 'spec_helper'

module HTML
  class Pipeline
    describe RevealCKEmojiFilter do
      let :asset_root do
        'https://github.githubassets.com/images/icons'
      end

      let :emoji_filter do
        RevealCKEmojiFilter.new(context: { asset_root: asset_root })
      end

      it 'replaces a known emoji token with an img tag' do
        result = emoji_filter.call('I :heart: emoji')
        expect(result).to include("<img class='emoji'")
        expect(result).to include("alt=':heart:'")
        expect(result).to include('src=')
      end

      it 'leaves unknown emoji tokens alone' do
        result = emoji_filter.call('I :dont_know: emoji')
        expect(result).to eq('I :dont_know: emoji')
      end
    end
  end
end
