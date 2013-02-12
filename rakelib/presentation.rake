require 'rake/clean'

# FileLists
DIR_IMAGES_FILES = FileList["images/**/*"]

revealjs = File.expand_path(File.join(File.dirname(__FILE__), '..', 'reveal.js'))
REVEAL_FILES = FileList["#{revealjs}/**/*"]

#
# task: slides
directory 'slides'
CLEAN.include 'slides'

#
# task: slides.html
desc 'Build slides.html'
file 'slides/slides.html' => [ 'slides.haml', 'slides' ] do
  processor = HamlProcessor.open 'slides.haml'
  File.open('slides/slides.html', 'w') { |f| f << processor.html }
end
CLEAN.include 'slides/slides.html'

#
# task: presentation
desc 'Build presentation'
task :presentation => [ 'slides/slides.html'] do
  cp_r REVEAL_FILES, 'slides'
  mkdir_p 'slides/images'
  cp_r DIR_IMAGES_FILES, 'slides/images'
  line_nums = {
    default_slides: {
      first: 37,
      last: 338
    }
  }
  default_slides = line_nums[:default_slides][:first]..line_nums[:default_slides][:last]
  FileSlicer.remove! 'slides/index.html', default_slides
  FileSplicer.insert! 'slides/slides.html', into: 'slides/index.html', after: '<div class="slides">'
end
