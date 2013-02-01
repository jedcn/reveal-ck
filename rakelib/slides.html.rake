desc 'Build slides.html'
file 'slides.html' => 'slides.haml' do
  processor = HamlProcessor.open 'slides.haml'
  File.open('slides.html', 'w') { |f| f << processor.html }
end
CLEAN.include 'slides.html'
