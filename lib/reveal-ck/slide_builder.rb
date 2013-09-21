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

      add_task "Slicing out reveal.js default slides",
               lambda {
                 begin_line_num = 38 # Line where I see <div class="slides">
                 end_line_num = 346 # Closing <div>
                 default_slides = begin_line_num..end_line_num
                 FileSlicer.remove! reveal_slides, default_slides
               }

      add_task "Splicing in slides from #{user_slides}",
               lambda {
                 FileSplicer.insert!(user_slides,
                                     into: reveal_slides,
                                     after: '<div class="slides">')
               }

      old_title = 'reveal.js - The HTML Presentation Framework'
      new_title = config.title
      add_task "Replacing the <title>",
               lambda {
                 FileStringReplacer.replace!(reveal_slides,
                                             old: old_title,
                                             new: new_title)
               }

      old_author = 'name="author" content="Hakim El Hattab"'
      new_author = 'name="author" content="' + config.author + '"'
      add_task "Replacing the <meta name='author'>",
               lambda {
                 FileStringReplacer.replace!(reveal_slides,
                                             old: old_author,
                                             new: new_author)
               }

      old_theme = 'href="css/theme/default.css" id="theme"'
      new_theme = 'href="css/theme/' + config.theme + '.css" id="theme"'
      add_task 'Replacing the core theme',
               lambda {
                 FileStringReplacer.replace!(reveal_slides,
                                             old: old_theme,
                                             new: new_theme)
               }
    end

  end
end
