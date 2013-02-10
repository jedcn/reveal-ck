require 'rake/clean'

file 'reveal.js/index.html' do
  `git submodule init`
  `git submodule update`
end

CLOBBER.include 'reveal.js'
task :clobber do
  # Spirit of clobber is to bring repository back to pristine state
  # after cloning. If that's the case, then we want to rm -r reveal.js
  # && mkdir reveal.js. By observation, redefining the task :clobber
  # and adding this mkdir achieves that
  mkdir 'reveal.js'
end
