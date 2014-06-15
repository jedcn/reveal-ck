require 'spec_helper'

describe RevealCK do
  describe '.path_to' do
    it 'provides the location of a file within the gem' do
      index_html_erb =
        RevealCK.path_to('templates',
                         'reveal.js',
                         'index.html.erb')
      content = File.open(index_html_erb).read
      expect(content).to be_a String
    end
  end
end
