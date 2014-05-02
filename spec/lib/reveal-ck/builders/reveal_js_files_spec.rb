require 'spec_helper'

module RevealCK
  module Builders
    describe RevealJsFiles do
      describe '#all' do
        let :reveal_js_dir do
          File.join(Dir.pwd, 'reveal.js')
        end
        let :reveal_js_files do
          RevealJsFiles.new(reveal_js_dir: reveal_js_dir)
        end
        it 'it names all of the needed reveal.js files' do
          all_files = reveal_js_files.all
          reveal_css = all_files.select do |file|
            file.include?('css/reveal.min.css')
          end
          expect(reveal_css.size).to eq 1
        end
      end
    end
  end
end
