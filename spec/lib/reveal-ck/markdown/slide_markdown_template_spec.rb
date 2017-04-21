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

      it 'does not turn _s within a single emoji into <em>s' do
        output = render_markdown <<-EOS.strip_heredoc
        :money_with_wings:
        EOS
        expect(output).to include ':money_with_wings:'
      end

      it 'does not turn _s between two emojis into <em>s' do
        output = render_markdown <<-EOS.strip_heredoc
        :blue_heart: :blue_heart:
        EOS
        expect(output).to include ':blue_heart: :blue_heart:'
      end

      it 'uses "---" to create "<section>"s' do
        output = render_markdown <<-EOS.strip_heredoc
        # h1 Slide
        ---
        ## h2 Slide
        EOS
        expect(output).to include '<h1>h1 Slide</h1>'
        expect(output).to include "</section>\n<section>"
        expect(output).to include '<h2>h2 Slide</h2>'
      end

      it 'wraps ``` code in a <pre> and <code>' do
        output = render_markdown <<-EOS.strip_heredoc
        ```
        def adder(a, b); a + b; end
        ```
        EOS
        expect(output).to include '<pre><code>'
        expect(output).to include '</code></pre>'
        expect(output).to include 'a + b'
      end

      it 'converts special characters in ``` block to entity references' do
        output = render_markdown <<-EOS.strip_heredoc
        ```
        <p>"&"</p>
        ```
        EOS
        expect(output).to include '<pre><code>'
        expect(output).to include '</code></pre>'
        expect(output).to include '&lt;p&gt;"&amp;"&lt;/p&gt;'
      end

      it 'wraps ```ruby code in a <pre> and <code class="language-ruby">' do
        output = render_markdown <<-EOS.strip_heredoc
        ```ruby
        def adder(a, b); a + b; end
        ```
        EOS
        expect(output).to include '<pre><code class="language-ruby">'
        expect(output).to include '</code></pre>'
        expect(output).to include 'a + b'
      end

      it 'works when there is no space surrounding the ---' do
        output = render_markdown <<-EOS.strip_heredoc
        # Your headline
        * Bullet 1
        * Bullet 2
        ---
        # Next Slide
        EOS
        expect(output).to include "</section>\n<section>"
      end
    end
  end
end
