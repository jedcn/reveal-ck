When(/^I temporarily start reveal\-ck serve$/) do
  port = 10_000 + rand(1000)
  run("reveal-ck serve --port #{port} --test-quit-after-starting 2")
end
