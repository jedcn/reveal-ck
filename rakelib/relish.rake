
namespace :relish do

  def run(cmd)
    require 'open3'
    puts "Running '#{cmd}'"
    Open3.popen3(cmd) do |_, o, e, _|
      puts 'STDOUT:'
      puts o.readlines
      puts
      puts 'STDERR:'
      puts e.readlines
    end
  end

  desc 'Publish to relish'
  task :push do
    run 'relish push jedcn/reveal-ck'
  end

  # I used this to initialize relish. I don't think I'll need to run
  # it again.. so there's no "desc," but it's here just in case.
  task :init do
    run 'relish projects:add jedcn/reveal-ck'
  end
end
