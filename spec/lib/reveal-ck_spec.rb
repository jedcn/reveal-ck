require 'spec_helper'

describe RevealCK do
  describe '.path' do
    it 'provides the location of any file stored within the gem' do
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

  describe '.template_path' do
    it 'provides the location of templates within the gem' do
      index_html_erb =
        RevealCK.template_path('index.html',
                               'index.html.erb')
      content = File.open(index_html_erb).read
      expect(content).to be_a String
    end
  end
end
