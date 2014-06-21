require 'spec_helper'
require 'tempfile'

module RevealCK
  module Markdown
    describe SlideMarkdownTemplate do

      def render_markdown(markdown)
        tmp_file = Tempfile.new(['test', '.md'])
        File.open(tmp_file, 'w') do |test_md|
          test_md.puts(markdown)
        end
        template = Tilt.new(tmp_file.path)
        template.render
      end

      it 'uses "---" to create "<section>"s' do
        output = render_markdown <<-eos
# h1 Slide
---
## h2 Slide
eos
        output.should include '<h1>h1 Slide</h1>'
        output.should include "</section>\n<section>"
        output.should include '<h2>h2 Slide</h2>'
      end

      it 'wraps ``` code in a <pre> and <code>' do
        output = render_markdown <<-eos
```
def adder(a, b); a + b; end
```
eos
        expect(output).to include '<pre><code>'
        expect(output).to include '</code></pre>'
        expect(output).to include 'a + b'
      end

      it 'creates an <aside class="notes"> when it sees a ```notes' do
        output = render_markdown <<-eos
```notes
This is a note
```
eos
        expect(output).to include "<aside class='notes'"
        expect(output).to include 'This is a note'
      end

      it 'creates an <aside class="notes"> when it sees a ```note' do
        output = render_markdown <<-eos
```note
This is a note
```
eos
        expect(output).to include "<aside class='notes'"
        expect(output).to include 'This is a note'
      end
    end
  end
end
