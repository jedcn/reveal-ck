require 'spec_helper'

module RevealCK
  describe SlimProcessor do

    it 'can convert slim to html' do
      p = SlimProcessor.new "p hi"
      p.html.should =~ /<p>\s+hi\s+<\/p>/
    end

    describe '.open' do

      let :abs_slim_file do
        spec_dir = File.expand_path(File.join(__FILE__, '..', '..', '..'))
        File.join spec_dir, 'data', 'slim', 'basic.slim'
      end

      let :rel_slim_file do
        'spec/data/slim/basic.slim'
      end

      let :html_version do
        spec_dir = File.expand_path(File.join(__FILE__, '..', '..', '..'))
        html = File.join spec_dir, 'data', 'html', 'converted_basic_slim.html'
        File.open(html).read
      end

      it 'converts an entire file via absolute path' do
        processor = SlimProcessor.open abs_slim_file
        processor.html.strip.should == html_version.strip
      end

      it 'converts an entire file via relative path' do
        processor = SlimProcessor.open rel_slim_file
        processor.html.strip.should == html_version.strip
      end

    end
  end
end
