Feature: Create users
  In order to have the site remember an individual's details and so grow a user base
  a user
  wants to be able to create an account
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Email" with "my_email@domain.com"
    And I press "Register"
    Then I should see "You are logged in as my_email@domain.com."
     And I should see a flash message "Thanks for registering. You are logged in."
