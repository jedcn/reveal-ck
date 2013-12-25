require 'spec_helper'

describe 'Tilt Configuration' do

  it 'uses SlideMarkdown to handle .md files' do
    Tilt['md'].should == RevealCK::Markdown::SlideMarkdownTemplate
  end

end
