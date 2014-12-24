require 'spec_helper'

module RevealCK
  module Render
    describe Scope do
      describe '#contents_of' do
        let :quote_file do
          spec_data 'render', 'scope', 'quote'
        end

        let :scope do
          Scope.new(dir: Dir.pwd, config: {})
        end

        it 'provides access to a file on the file system' do
          quote = scope.contents_of quote_file
          expect(quote).to include 'begin it'
        end
      end

      describe '#css_files' do
        let :css_dir do
          spec_data 'render', 'scope', 'css_dir'
        end

        let :scope do
          Scope.new(dir: css_dir, config: {})
        end

        it 'can return a list of the css files' do
          css_files = scope.css_files
          expect(css_files.size).to eq 2
          expect(css_files).to include 'css/custom.css'
          expect(css_files).to include 'css/nested/custom.css'
        end
      end
    end
  end
end
