require 'spec_helper'

module RevealCK
  describe HamlProcessor do

    it 'can convert haml to html' do
      p = HamlProcessor.new "%p hi"
      p.html.should =~ %r{<p>hi</p>}
    end

    describe '.open' do

      let :abs_haml_file do
        spec_dir = File.expand_path(File.join(__FILE__, '..', '..', '..'))
        File.join spec_dir, 'data', 'haml', 'basic.haml'
      end

      let :rel_haml_file do
        'spec/data/haml/basic.haml'
      end

      let :html_version do
        spec_dir = File.expand_path(File.join(__FILE__, '..', '..', '..'))
        html = File.join spec_dir, 'data', 'html', 'converted_basic_haml.html'
        File.open(html).read
      end

      it 'converts an entire file via absolute path' do
        processor = HamlProcessor.open abs_haml_file
        processor.html.should == html_version
      end

      it 'converts an entire file via relative path' do
        processor = HamlProcessor.open rel_haml_file
        processor.html.should == html_version
      end

    end
  end
end
