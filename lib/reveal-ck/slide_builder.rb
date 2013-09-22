module RevealCK
  #
  # Public: A SlideBuilder knows how to build the index.html file (the
  # core slides) within a reveal.js presentation.
  #
  class SlideBuilder < Builder

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
    end

    def remove_default_content(file)
      add_task 'Slicing out reveal.js default slides' do
        begin_line_num = 38 # Line where I see <div class="slides">
        end_line_num = 346 # Closing <div>
        default_slides = begin_line_num..end_line_num
        FileSlicer.remove! file, default_slides
      end
    end

    def add_user_content(file, user_slides)
      add_task "Splicing in slides from #{user_slides}" do
        FileSplicer.insert!(user_slides,
                            into: file,
                            after: '<div class="slides">')
      end
    end

    def replace_title(file, title)
      old_title = 'reveal.js - The HTML Presentation Framework'
      new_title = title
      add_task 'Replacing the <title>' do
        FileStringReplacer.replace!(file,
                                    old: old_title,
                                    new: new_title)
      end
    end

    def replace_author(file, author)
      old_author = 'name="author" content="Hakim El Hattab"'
      new_author = 'name="author" content="' + author + '"'
      add_task "Replacing the <meta name='author'>" do
        FileStringReplacer.replace!(file,
                                    old: old_author,
                                    new: new_author)
      end
    end

    def replace_theme(file, theme)
      old_theme = 'href="css/theme/default.css" id="theme"'
      new_theme = 'href="css/theme/' + theme + '.css" id="theme"'
      add_task 'Replacing the core theme' do
        FileStringReplacer.replace!(file,
                                    old: old_theme,
                                    new: new_theme)
      end
    end

  end
end
