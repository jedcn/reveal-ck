require 'spec_helper'

module RevealCK
  module Builders
    describe IndexHtmlRenderScope do
      let :dir do
        spec_data 'builders', 'index_html_render_scope'
      end

      let :scope do
        IndexHtmlRenderScope.new(dir: dir)
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
