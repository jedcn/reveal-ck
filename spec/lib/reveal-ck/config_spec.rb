require 'spec_helper'

module RevealCK
  describe Config do

    let :config do
      Config.new
    end

    it 'supplies an #theme, and #theme=' do
      config.theme = 'night'
      expect(config.theme).to eq 'night'
    end

    it 'supplies a default theme' do
      expect(config.theme).to eq 'default'
    end

    it 'supplies an #author, and #author=' do
      config.author = 'Jed Northridge'
      expect(config.author).to eq 'Jed Northridge'
    end

    it 'supplies a default author' do
      expect(config.author).to eq ''
    end

    it 'supplies an #title, and #title=' do
      config.title = 'My Presentation'
      expect(config.title).to eq 'My Presentation'
    end

    it 'supplies a default title' do
      expect(config.title).to eq 'Slides'
    end

    it 'supplies an #transition, and #transition=' do
      config.transition = 'page'
      expect(config.transition).to eq 'page'
    end

    it 'supplies a default transition' do
      expect(config.transition).to eq 'default'
    end
  end
end
