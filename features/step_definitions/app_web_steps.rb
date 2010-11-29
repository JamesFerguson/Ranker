Then /^the page I'm on should match (.*)?$/ do |page_name|
  actual_page_source = page.source
  When "I go to #{page_name}"
  expected_page_source = page.source
  actual_page_source.should match(expected_page_source)
end
