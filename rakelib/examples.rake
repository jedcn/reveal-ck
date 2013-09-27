desc 'Exercise reveal-ck examples'
task :examples do
  examples = FileList["examples/*"]
  examples.each do |example|
    load example
  end
end
