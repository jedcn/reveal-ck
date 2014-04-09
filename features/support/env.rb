require 'aruba/cucumber'

#
# Add bin/ to our PATH
BIN_DIR = File.expand_path(File.dirname(__FILE__) + '/../../bin')
ENV['PATH'] = "#{BIN_DIR}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

#
#  ???
THIS_DIR = File.dirname(__FILE__)
LIB_DIR = File.join(File.expand_path(THIS_DIR), '..', '..', 'lib')

Before do
  # Using "announce" causes massive warnings on 1.9.2
  @puts = true
  @original_rubylib = ENV['RUBYLIB']
  ENV['RUBYLIB'] = LIB_DIR + File::PATH_SEPARATOR + ENV['RUBYLIB'].to_s
end

After do
  ENV['RUBYLIB'] = @original_rubylib
end
