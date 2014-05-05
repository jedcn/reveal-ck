require 'spec_helper'

module RevealCK
  describe Config do

    let :config do
      Config.new
    end

    describe 'core attributes' do

      it 'supplies a default theme' do
        expect(config.theme).to eq 'default'
      end

      it 'supplies an #theme, and #theme=' do
        config.theme = 'night'
        expect(config.theme).to eq 'night'
      end

      it 'supplies a default author' do
        expect(config.author).to eq ''
      end

      it 'supplies an #author, and #author=' do
        config.author = 'Jed Northridge'
        expect(config.author).to eq 'Jed Northridge'
      end

      it 'supplies a default title' do
        expect(config.title).to eq 'Slides'
      end

      it 'supplies an #title, and #title=' do
        config.title = 'My Presentation'
        expect(config.title).to eq 'My Presentation'
      end

      it 'supplies a default transition' do
        expect(config.transition).to eq 'default'
      end

      it 'supplies an #transition, and #transition=' do
        config.transition = 'page'
        expect(config.transition).to eq 'page'
      end
    end

    describe 'reveal_js options' do
      it 'supplies standard defaults' do
        expect(config.reveal_js['controls']).to eq true
        expect(config.reveal_js['progress']).to eq true
        expect(config.reveal_js['history']).to eq true
        expect(config.reveal_js['center']).to eq true
      end
    end

    describe '#merge!' do
      it 'allows for a mass assignment of hash values' do
        new_value = 'New Value'
        config.merge!('author' => new_value,
                      'new_item' => new_value,
                      :new_symbol => new_value)
        expect(config.author).to eq(new_value)
        expect(config.new_item).to eq(new_value)
        expect(config.new_symbol).to eq(new_value)
      end
    end
  end
end
