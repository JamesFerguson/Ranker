Given /^the following users:$/ do |users|
  User.create!(users.hashes)
  @user = User.find_by_email(users.hashes.last[:email])
  @user_hash = users.hashes.last
end

When /^I delete the (\d+)(?:st|nd|rd|th) user$/ do |pos|
  visit users_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following users:$/ do |expected_users_table|
  expected_users_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I am logged in as them$/ do
  steps(
    %Q{
      Given I am on the login user page
       And I fill in "Email" with "#{@user_hash[:email]}"
       And I fill in "Password" with "#{@user_hash[:password]}"
       And I press "Login"
    }
  )
end
