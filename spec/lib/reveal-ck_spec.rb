require 'spec_helper'

describe RevealCK, '::REVEALJS_FILES' do

  it 'is a list of the bundled reveal.js files' do
    bundled_files = RevealCK::REVEALJS_FILES
    bundled_index_html = bundled_files.find do |name|
      name.include? 'reveal.js/index.html'
    end

    expect(bundled_files).to be_an Array
    expect(bundled_index_html).to_not be_empty
  end

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
