Given(/^a file named "(.*?)" that's a copy of "(.*?)"$/) do |dest, src|
  copy_file_under_features src, dest
end
