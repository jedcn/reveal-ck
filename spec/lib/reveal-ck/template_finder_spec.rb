require 'spec_helper'
require 'tmpdir'
require 'fileutils'

module RevealCK

  describe TemplateFinder do

    let :reveal_ck_dir do
      Dir.pwd
    end

    describe '#paths' do

      it 'defaults to Dir.pwd, Dir.pwd/templates, and reveal-ck/templates' do
        finder = TemplateFinder.new
        expect(finder.paths).to include Dir.pwd
        expect(finder.paths).to include File.join(Dir.pwd, 'templates')
        expect(finder.paths).to include File.join(reveal_ck_dir, 'templates')
        expect(finder.paths.size).to eq 3
      end

      it 'can be assigned via initializer' do
        Dir.mktmpdir do |dir|
          finder = TemplateFinder.new paths: [ dir, File.join(dir, 'templates') ]
          expect(finder.paths).to include dir
          expect(finder.paths).to include File.join(dir, 'templates')
          expect(finder.paths.size).to eq 2
        end
      end

    end

    describe '#find' do

      let :template_finder_dir do
        File.join reveal_ck_dir, 'spec', 'data', 'template_finder'
      end

      let :automated_dir do
        File.join template_finder_dir, 'automated'
      end

      let :custom_dir do
        File.join template_finder_dir, 'custom'
      end

      let :reveal_ck_templates_dir do
        File.join reveal_ck_dir, 'templates'
      end

      let :finder do
        paths = [custom_dir, automated_dir, reveal_ck_templates_dir]
        TemplateFinder.new paths: paths
      end

      it 'searches all paths to find templates' do
        result = finder.find 'automated'
        expect(result).to include File.join('template_finder', 'automated', 'automated.slim')
        result = finder.find 'custom'
        expect(result).to include File.join('template_finder', 'custom', 'custom.slim')
        result = finder.find 'title'
        expect(result).to include File.join('reveal-ck', 'templates', 'title.slim')
      end

      it 'searchs paths in order and returns the first match' do
        result = finder.find 'common.haml'
        expect(result).to include File.join('custom', 'common.haml')
      end

      it 'can search by partial file name' do
        result = finder.find 'common'
        expect(result).to include File.join('custom', 'common.haml')
      end

    end
  end
end
