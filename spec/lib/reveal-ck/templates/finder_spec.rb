require 'spec_helper'
require 'tmpdir'
require 'fileutils'

module RevealCK
  module Templates
    describe Finder do
      let :reveal_ck_dir do
        Dir.pwd
      end

      describe '#paths' do
        it 'defaults to Dir.pwd/templates and reveal-ck\'s slide templates' do
          Dir.mktmpdir do |dir|
            Dir.chdir(dir) do
              finder = Finder.new
              expect(finder.paths).to include File.join(Dir.pwd, 'templates')
              expect(finder.paths)
                .to(include(RevealCK.template_path('slides')))
              expect(finder.paths.size).to eq 2
            end
          end
        end

        it 'can be assigned via initializer' do
          Dir.mktmpdir do |dir|
            paths = [dir, File.join(dir, 'templates')]
            finder = Finder.new paths: paths
            expect(finder.paths).to include dir
            expect(finder.paths).to include File.join(dir, 'templates')
            expect(finder.paths.size).to eq 2
          end
        end
      end

      describe '#find' do
        let :project_templates do
          spec_data 'templates', 'finder', 'templates'
        end

        let :reveal_ck_templates_dir do
          File.join(reveal_ck_dir, 'files', 'reveal-ck', 'templates', 'slides')
        end

        let :finder do
          paths = [project_templates, reveal_ck_templates_dir]
          Finder.new paths: paths
        end

        it 'searches project templates/ and reveal-ck\'s slide templates' do
          result = finder.find 'template_one'
          template_one = File.join('templates', 'template_one.slim')
          expect(result).to include template_one

          result = finder.find 'intro'
          intro_slim = RevealCK.template_path('slides', 'intro.slim')
          expect(result).to include intro_slim
        end

        it 'searches in order and returns the first match' do
          result = finder.find 'text'
          expect(result).to include File.join('templates', 'text.slim')

          result = finder.find 'quote'
          expect(result).to include reveal_ck_templates_dir
        end

        it 'searches for files based on the beginnings of names' do
          result = finder.find 'tex'
          expect(result).to include File.join('templates', 'text.slim')
        end

        it 'only finds regular files' do
          result = finder.find 'code'
          expect(result).to include reveal_ck_templates_dir
        end

        it 'raises if it cannot find what you asked for' do
          expect { finder.find 'unknown' }.to(
            raise_error(RuntimeError, /Unable to find unknown/)
          )
        end
      end
    end
  end
end
