require 'aruba/cucumber'

Before('@slow') do
  @aruba_io_wait_seconds = 10
  @aruba_timeout_seconds = 10
end

After('@slow') do
  @aruba_io_wait_seconds = nil
  @aruba_timeout_seconds = nil
end
