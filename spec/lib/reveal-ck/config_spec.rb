require 'spec_helper'

module RevealCK
  describe Config do

    context 'when no config is supplied' do

      let :config do
        Config.new
      end

      it '#title defaults to "Slides"' do
        config.title.should == "Slides"
      end

      it '#author defaults to "Hakim El Hattab"' do
        config.author.should == "Hakim El Hattab"
      end

      it '#theme defaults to "default"' do
        config.theme.should == "default"
      end

      it '#transition defaults to "default"' do
        config.transition.should == "default"
      end

    end

    context 'when a config is supplied' do

      let :config_file do
        File.join 'spec', 'data', 'config', 'config.toml'
      end

      let :config do
        Config.new config_file: config_file
      end

      it '#title comes from the config file' do
        expect(config.title).to eq "The Never Sea Slides"
      end

      it '#author comes from the config file' do
        expect(config.author).to eq "Captain Hook"
      end

      it '#theme comes from the config file' do
        config.theme.should == "night"
      end

      it '#transition comes from the config file' do
        config.transition.should == "page"
      end

    end
  end
end
