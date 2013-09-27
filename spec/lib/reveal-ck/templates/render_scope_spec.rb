require 'spec_helper'

module RevealCK
  module Templates
    describe RenderScope do

      let :quote_file do
        spec_data 'templates', 'render_scope', 'quote'
      end

      let :render_scope do
        RenderScope.new
      end

      describe '#contents_of' do
        it 'provides access to a file on the file system' do
          quote = render_scope.contents_of quote_file
          expect(quote).to include 'begin it'
        end
      end

    end
  end
end
