require 'spec_helper'

describe 'Tilt Configuration' do

  it 'uses SlideMarkdown to handle .md files' do
    expect(Tilt['md']).to eq(RevealCK::Markdown::SlideMarkdownTemplate)
  end

end
