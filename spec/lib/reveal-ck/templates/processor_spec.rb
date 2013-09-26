require 'spec_helper'

module RevealCK
  module Templates
    describe Processor do

      let :slim_file do
        spec_data 'processor', 'basic.slim'
      end

      let :haml_file do
        spec_data 'processor', 'basic.haml'
      end

      let :pretty_printed_basic do
        /<p>\s+This is basic (Slim|Haml)\s+<\/p>/
      end

      it 'can process a slim template' do
        processor = Processor.open slim_file
        processor.output.should match pretty_printed_basic
      end

      it 'can process a haml template' do
        processor = Processor.open haml_file
        processor.output.should match pretty_printed_basic
      end

    end
  end
end
