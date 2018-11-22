When(/^I temporarily start reveal\-ck serve with host "(.*?)"$/) do |host|
  port = rand(10_000..11_000)
  cmd = "reveal-ck serve --port #{port} --host #{host}"
  run("#{cmd} --test-quit-after-starting 2")
end
