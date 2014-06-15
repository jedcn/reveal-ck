require 'spec_helper'

describe RevealCK do
  describe '.path' do
    it 'provides the location of a file within the gem' do
      index_html_erb =
        RevealCK.path('files',
                      'reveal-ck',
                      'templates',
                      'index.html',
                      'index.html.erb')
      content = File.open(index_html_erb).read
      expect(content).to be_a String
    end
  end
end
