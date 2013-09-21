begin
  require 'cane/rake_task'

  desc 'Run cane to check quality metrics'
  Cane::RakeTask.new(:quality) do |cane|
    cane.canefile = '.cane'
  end
rescue LoadError
  warn "cane not available, quality task not provided."
end
