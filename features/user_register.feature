Feature: Create users
  In order to have the site remember an individual's details and so grow a user base
  a user
  wants to be able to create an account
  
  Scenario: Register new user
    Given I am on the new user registration page
    When I fill in "Email" with "my_email@domain.com"
     And I fill in "Password" with "1234567890"
     And I fill in "Password confirmation" with "1234567890"
     And I press "Register"
    Then I should see a flash notice "You have registered successfully. You will receive an email with instructions about how to confirm your account in a few minutes."
     And I should see "You are logged in as my_email@domain.com."
     And I should be on the X page
     And I should receive an email ...
