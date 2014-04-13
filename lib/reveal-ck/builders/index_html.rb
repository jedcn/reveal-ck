module RevealCK
  module Builders
    #
    # Public: An IndexHtml knows how to build the index.html file (the
    # core slides) within a reveal.js presentation.
    #
    class IndexHtml < Builder
      attr_reader :user_slides, :reveal_slides

      attr_reader :tasks

      attr_reader :config

      def initialize(args)
        @user_slides = args[:user_slides]
        @reveal_slides = args[:reveal_slides]
        @config = args[:config]
      end

      private

      def register_tasks
        @tasks = []

        remove_default_content reveal_slides
        add_user_content reveal_slides, user_slides
        replace_title reveal_slides, config.title
        replace_author reveal_slides, config.author
        replace_theme reveal_slides, config.theme
        replace_transition reveal_slides, config.transition
      end

      def remove_default_content(file)
        add_task 'Slicing out reveal.js default slides' do
          begin_line_num = 38 # Line where I see <div class="slides">
          end_line_num = 346 # Closing <div>
          default_slides = begin_line_num..end_line_num
          Changers::Slicer.remove! file, default_slides
        end
      end

      def add_user_content(file, user_slides)
        add_task "Splicing in slides from #{user_slides}" do
          Changers::Splicer.insert!(user_slides,
                                    into: file,
                                    after: '<div class="slides">')
        end
      end

      def replace_task(args)
        action = args[:action] || fail(':action is required')
        old    = args[:old]    || fail(':old is required')
        new    = args[:new]    || fail(':new is required')
        file   = args[:file]   || fail(':file is required')
        add_task action do
          Changers::StringReplacer.replace! file, old: old, new: new
        end
      end

      def replace_title(file, title)
        replace_task action: 'Replacing the <title>',
                     file: file,
                     old: 'reveal.js - The HTML Presentation Framework',
                     new: title
      end

      def replace_author(file, author)
        replace_task action: "Replacing the <meta name='author'>",
                     file: file,
                     old: 'name="author" content="Hakim El Hattab"',
                     new: 'name="author" content="' + author + '"'
      end

      def replace_theme(file, theme)
        replace_task action: 'Replacing the core theme',
                     file: file,
                     old: 'href="css/theme/default.css" id="theme"',
                     new: 'href="css/theme/' + theme + '.css" id="theme"'
      end

      def replace_transition(file, transition)
        replace_task action: 'Replacing the core transition',
                     file: file,
                     old: "Reveal.getQueryHash().transition || 'default'",
                     new: "Reveal.getQueryHash().transition || '#{transition}'"
      end
    end
  end
end
