require 'rake/clean'

# FileLists
DIR_IMAGES_FILES = FileList["images/**/*"]

revealjs = File.expand_path(File.join(File.dirname(__FILE__), '..', 'reveal.js'))
REVEAL_FILES = FileList["#{revealjs}/**/*"]

#
# task: slides
task 'slides' do
  mkdir_p 'slides', verbose: false
end
CLEAN.include 'slides'

#
# task: slides.html
desc 'Build slides.html'
file 'slides/slides.html' => [ 'slides.haml', 'slides' ] do
  processor = RevealCK::HamlProcessor.open 'slides.haml'
  File.open('slides/slides.html', 'w') { |f| f << processor.html }
end
CLEAN.include 'slides/slides.html'

#
# task: presentation
desc 'Build presentation'
task :presentation => [ 'slides/slides.html'] do

  cp_r REVEAL_FILES, 'slides', verbose: false

  mkdir_p 'slides/images', verbose: false
  cp_r DIR_IMAGES_FILES, 'slides/images', verbose: false

  builder = RevealCK::SlideBuilder.new({
                                         user_slides: 'slides/slides.html',
                                         reveal_slides: 'slides/index.html'
                                       })

  builder.build!
end
