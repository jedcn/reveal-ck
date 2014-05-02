desc 'Run Continuous Integration'
task ci: [:spec, :rubocop, :cucumber]
