require 'aruba/cucumber'

Before do
  @aruba_io_wait_seconds = 10
  @aruba_timeout_seconds = 10
end
