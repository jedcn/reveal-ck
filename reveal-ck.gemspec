# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "reveal-ck/version"

Gem::Specification.new do |s|
  s.name        = "reveal-ck"
  s.version     = RevealCK::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jed Northridge"]
  s.email       = ["northridge@gmail.com"]
  s.homepage    = "https://github.com/jedcn/reveal-ck"
  s.description = "A reveal.js construction kit"
  s.summary     = "A toolkit that takes a minimal description of slides and builds a reveal.js presentation"

  #
  # Runtime Dependencies
  s.add_dependency 'haml', '~> 4.0.3'
  s.add_dependency 'gli', '~> 2.5.4'
  s.add_dependency 'toml', '~> 0.0.3'
  s.add_dependency 'rake', '~> 10.1.0'

  #
  # Development Dependencies
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"

  files = {
    core: ["LICENSE", "Rakefile", "Gemfile"],
    reveal: Dir.glob('reveal.js/**/*'),
    lib: `git ls-files lib`.split("\n"),
    rakelib: `git ls-files rakelib`.split("\n")
  }

  s.files         = files[:core] + files[:reveal] + files[:lib] + files[:rakelib]
  s.test_files    = `git ls-files -- {spec,features}/**/*`.split("\n")
  s.executables   = ["reveal-ck"]
  s.require_paths = ["lib"]

  s.date = "2013-07-07"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]

  # s.files = [
  #   ".gitmodules",
  #   ".rspec",
  #   ".rvmrc",
  #   ".travis.yml",
  #   "Gemfile",
  #   "Gemfile.lock",
  #   "LICENSE",
  #   "README.md",
  #   "Rakefile",
  #   "VERSION",
  #   "reveal-ck.gemspec",
  # ]

  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
end
