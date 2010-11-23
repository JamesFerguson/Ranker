Then /^I should see a flash ([^ ]*) "([^"]*)"$/ do |kind,msg|
  Then %{I should see "#{msg}" within "#flash_#{kind}"}
end

Then /^I debug$/ do
  breakpoint
  0
end
