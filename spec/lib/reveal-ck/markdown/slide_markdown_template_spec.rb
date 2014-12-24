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
        expect(output).to include '<h1>h1 Slide</h1>'
        expect(output).to include "</section>\n<section>"
        expect(output).to include '<h2>h2 Slide</h2>'
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

      it 'wraps ```ruby code in a <pre> and <code class="ruby">' do
        output = render_markdown <<-eos
```ruby
def adder(a, b); a + b; end
```
eos
        expect(output).to include '<pre><code class="ruby">'
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

      it 'works when there is no space surrounding the ---' do
        output = render_markdown <<-eos
# Your headline
* Bullet 1
* Bullet 2
---
# Next Slide
eos
        expect(output).to include "</section>\n<section>"
      end
    end
  end
end
