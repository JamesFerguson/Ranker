Feature: Create users
  In order to have the site remember an individual's details and so grow a user base
  a user
  wants to be able to create an account
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Email" with "my_email@domain.com"
     And I fill in "Password" with "1234567890"
     And I fill in "Password confirmation" with "1234567890"
     And I press "Register"
    Then I should see a flash notice "You have registered successfully. If enabled, a confirmation was sent to your e-mail."
     And I should see "You are logged in as my_email@domain.com."
