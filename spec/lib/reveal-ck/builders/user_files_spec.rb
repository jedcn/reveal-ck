require 'spec_helper'

module RevealCK
  module Builders
    describe UserFiles do
      describe '#all' do
        let :stand_in_user_files_dir do
          File.join(Dir.pwd, 'reveal.js')
        end

        let :user_files do
          UserFiles.new(dir: stand_in_user_files_dir)
        end

        describe '#files' do
          it 'it names the files that will be copied into a presentation' do
            user_css = user_files.files.select do |file|
              file.include?('css/reveal.min.css')
            end
            expect(user_css.size).to eq 1
          end
        end

        describe '#dir' do
          it 'it names the directory where the files can be found' do
            expect(user_files.dir).to eq stand_in_user_files_dir
          end
        end
      end
    end
  end
end
