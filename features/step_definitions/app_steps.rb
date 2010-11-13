Then /^I should see a flash ([^ ]*) "([^"]*)"$/ do |kind,msg|
  Then %{I should see "#{msg}" within "##{kind}"}
end