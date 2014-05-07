require 'spec_helper'

module RevealCK
  module Render
    describe Scope do

      let :quote_file do
        spec_data 'templates', 'render_scope', 'quote'
      end

      let :scope do
        Scope.new
      end

      describe '#contents_of' do
        it 'provides access to a file on the file system' do
          quote = scope.contents_of quote_file
          expect(quote).to include 'begin it'
        end
      end

    end
  end
end
