require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = 'reveal-ck'
  gem.homepage = 'https://github.com/jedcn/reveal-ck'
  gem.license = 'MIT'
  gem.summary = %Q{A toolkit that takes a minimal description of slides and builds a reveal.js presentation}
  gem.description = 'A reveal.js construction kit'
  gem.email = 'northridge@gmail.com'
  gem.authors = ['Jed Northridge']
  gem.files.include 'reveal.js/**/*'
end
Jeweler::RubygemsDotOrgTasks.new
