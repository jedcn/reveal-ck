def change_file(filepath, regex, regex_replacement)
  current_content = File.open(filepath).read
  new_content = current_content.gsub(regex, regex_replacement)
  IO.write(filepath, new_content)
end

def update_version_rb(new_version)
  change_file('lib/reveal-ck/version.rb',
              /^  VERSION = '.*'\.freeze$/,
              "  VERSION = '#{new_version}'.freeze")
end

def update_gemspec(todays_date)
  change_file('reveal-ck.gemspec',
              /^  s.date = '.*'$/,
              "  s.date = '#{todays_date}'")
end

def update_detailed_changes(old_version, new_version, todays_date)
  b = binding
  detailed_changes = File.open('rakelib/detailed_changes.erb').read
  modified = ERB.new(detailed_changes).result(b)
  change_file('CHANGELOG.md',
              /^## \[Unreleased\]\[unreleased\]\n\n\[unreleased\]: .*$\n/,
              modified)
end

def add_unreleased_preamble(new_version)
  b = binding
  unreleased = File.open('rakelib/unreleased.erb').read
  modified = ERB.new(unreleased).result(b)
  change_file('CHANGELOG.md',
              /^bugs are fixed.\n$/,
              "bugs are fixed.\n#{modified}")
end

def update_changelog(old_version, new_version, todays_date)
  update_detailed_changes(old_version, new_version, todays_date)
  add_unreleased_preamble(new_version)
end

def echo(str)
  puts "\n#{str}\n"
end

def print_next_steps(new_version)
  echo 'Modified:'
  echo " * lib/reveal-ck/version.rb\n * reveal-ck.gemspec\n * CHANGELOG.md"
  echo '1. Next:'
  commit_msg = "Updating CHANGELOG, version, .gemspec for #{new_version}"
  echo "  git add . && git commit -m '#{commit_msg}'"
  echo '2. Verify your commit diff and then push to master'
  echo '3. Visit: https://travis-ci.org/jedcn/reveal-ck/ and verify it passes'
  echo '4. Release to rubygems:'
  echo '  rm -rf pkg/* && bundle exec rake && bundle exec rake release'
  echo "5. Update Relish: 'rake relish:push'\n"
end

desc 'Prepare to Release'
task :prep_release do
  new_version = ENV['NEW_VERSION']
  raise 'Need to set env NEW_VERSION' unless new_version

  todays_date = Time.now.strftime('%Y-%m-%d')
  update_version_rb(new_version)
  update_gemspec(todays_date)
  current_version = RevealCK::VERSION
  update_changelog(current_version, new_version, todays_date)
  print_next_steps(new_version)
end
