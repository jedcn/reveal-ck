require 'spec_helper'

module RevealCK

  describe Config do

    class Example
      include Config
    end

    context 'when included in a class' do

      it 'supplies an #theme, and #theme=' do
        example = Example.new
        example.theme = 'night'
        expect(example.theme).to eq 'night'
      end

      it 'supplies a default theme' do
        example = Example.new
        expect(example.theme).to eq 'default'
      end

      it 'supplies an #author, and #author=' do
        example = Example.new
        example.author = 'Jed Northridge'
        expect(example.author).to eq 'Jed Northridge'
      end

      it 'supplies a default author' do
        example = Example.new
        expect(example.author).to eq ''
      end

      it 'supplies an #title, and #title=' do
        example = Example.new
        example.title = 'My Presentation'
        expect(example.title).to eq 'My Presentation'
      end

      it 'supplies a default title' do
        example = Example.new
        expect(example.title).to eq 'Slides'
      end

      it 'supplies an #transition, and #transition=' do
        example = Example.new
        example.transition = 'page'
        expect(example.transition).to eq 'page'
      end

      it 'supplies a default transition' do
        example = Example.new
        expect(example.transition).to eq 'default'
      end

    end

    describe '#merge_config' do

      let :full_config_file do
        spec_data 'config', 'full_config.yml'
      end

      let :partial_config_file do
        spec_data 'config', 'partial_config.yml'
      end

      it 'writes unset config options stored in a file' do
        example = Example.new
        example.merge_config file: full_config_file
        expect(example.title).to eq 'The Never Sea Slides'
        expect(example.author).to eq 'Captain Hook'
        expect(example.theme).to eq 'night'
        expect(example.transition).to eq 'page'
      end

      it 'can grab just a single option' do
        example = Example.new
        example.merge_config file: partial_config_file
        expect(example.title).to eq 'The Never Sea Slides'
      end

      it 'will not overwrite already set config options' do
        example = Example.new
        example.author = 'Jed Northridge'
        example.transition = 'fade'
        example.merge_config file: full_config_file
        expect(example.author).to eq 'Jed Northridge'
        expect(example.transition).to eq 'fade'
        expect(example.title).to eq 'The Never Sea Slides'
        expect(example.theme).to eq 'night'
      end

    end

  end
end
