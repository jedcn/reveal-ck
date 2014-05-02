require 'spec_helper'

module RevealCK
  module Builders
    describe UserFiles do
      describe '#all' do
        let :stand_in_user_files_dir do
          File.join(Dir.pwd, 'reveal.js')
        end
        let :user_files do
          UserFiles.new(user_files_dir: stand_in_user_files_dir)
        end
        it 'it names the files that will be copied into a presentation' do
          all_files = user_files.all
          user_css = all_files.select do |file|
            file.include?('css/reveal.min.css')
          end
          expect(user_css.size).to eq 1
        end
      end
    end
  end
end
