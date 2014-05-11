require 'spec_helper'

module RevealCK
  module Builders
    describe RevealJsFiles do
      describe '#all' do
        let :dir do
          File.join(Dir.pwd, 'reveal.js')
        end

        let :reveal_js_files do
          RevealJsFiles.new(dir: dir)
        end

        describe '#files' do
          it 'it names all of the needed reveal.js files' do
            reveal_css = reveal_js_files.files.select do |file|
              file.include?('css/reveal.min.css')
            end
            expect(reveal_css.size).to eq 1
          end
        end

        describe '#dir' do
          it 'it names the directory where the files can be found' do
            expect(reveal_js_files.dir).to eq dir
          end
        end
      end
    end
  end
end
