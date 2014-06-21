require 'spec_helper'

module RevealCK
  module Templates
    describe Processor do

      let :config do
        Config.new
      end

      let :slim_file do
        spec_data 'templates', 'processor', 'basic.slim'
      end

      let :haml_file do
        spec_data 'templates', 'processor', 'basic.haml'
      end

      let :pretty_printed_basic do
        /<p>\s+This is basic (Slim|Haml)\s+<\/p>/
      end

      it 'can process a slim template' do
        processor = Processor.open file: slim_file, config: config
        expect(processor.output).to match pretty_printed_basic
      end

      it 'can process a haml template' do
        processor = Processor.open file: haml_file, config: config
        expect(processor.output).to match pretty_printed_basic
      end

    end
  end
end
