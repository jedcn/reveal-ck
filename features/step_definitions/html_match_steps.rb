require 'nokogiri'

def check_html_matches(file, selector_list, selector_type)
  content = IO.read(expand_path(file))
  doc = Nokogiri::HTML(content)
  selector_list.each do |selector, description|
    check_doc_matches(doc, selector, description, selector_type)
  end
end

def check_doc_matches(doc, selector, description, type)
  search_result = doc.send(type, selector)
  return unless search_result.empty?

  message = "Could not find #{description}. "
  message += "No match for #{type} '#{selector}'"
  raise message
end

Then(/^the file "(.*?)" should have html matching the css:$/) do |file, table|
  check_html_matches(file, table.raw, :css)
end

Then(/^the file "(.*?)" should have html matching the xpath:$/) do |file, table|
  check_html_matches(file, table.raw, :xpath)
end
