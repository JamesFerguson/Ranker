# Creation
Given /^the following (un)?(confirmed)? ?users:$/ do |un, confirmed, users|
  users.hashes.each do |hash|
    @user = User.create!(hash)
    @user.confirm! if !confirmed.nil? && un.nil?
  end
  @user_hash = users.hashes.last
end

# Deletion
When /^I delete the (\d+)(?:st|nd|rd|th) user$/ do |pos|
  visit users_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

# Login
Given /^I am logged in as them$/ do
  login_with :email => @user_hash[:email], :password => @user_hash[:password]
end

When /^I unsuccessfully login (\d+) times$/ do |number|
  number = number.to_i
  for num in 1..number do
    login_with :email => @user.email, :password => "cheese"
    unless num == number
      Then %Q{I should see "That email or password was invalid"}
    end
  end
end

Then /^my account should be locked$/ do
  @user.reload
  @user.access_locked?.should be_true
end

def login_with(options)
  steps(
    %Q{
      Given I am on the login user page
       And I fill in "Email" with "#{options[:email]}"
       And I fill in "Password" with "#{options[:password]}"
       And I press "Login"
    }
  )  
end

# Fudge for registration to make later steps more concise
Then /^I am the user with email "([^"]*)"$/ do |email|
  email.should_not be_empty
  User.find_by_email(email).should_not be_nil
  @user = User.find_by_email(email)
end

# Index
Then /^I should see the following users:$/ do |expected_users_table|
  expected_users_table.diff!(tableish('table tr', 'td,th'))
end

# Show/index
Then /^the "([^"]*)" field should contain my (?:.*)$/ do |field|
  page.field_labeled(field).should_not be_nil
  attr_name = page.field_labeled(field)[:id][5..-1] # trim 'user_' off the start
  
  @user.should respond_to(attr_name)
  attr_val = @user.send(attr_name)
  
  Then %Q{the "#{field}" field should contain "#{attr_val}"}
end

Then /^I should see my (?:.*) in the "([^"]*)" field$/ do |field|
  page.find("th", :text => field).should_not be_nil
  # use text of field header to find id for value element
  selector = page.find("th", :text => field).node[:id].sub!(/_header/, '')
  
  attr_name = selector.sub(/_user.*/, '')
  @user.should respond_to(attr_name)
  
  attr_val = @user.send(attr_name)
  
  Then %Q{I should see "#{attr_val}" within "##{selector}"}
end
