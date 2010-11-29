Feature: Login existing user
  In order to have the site remember an individual's details and so grow a user base
  a user
  wants to be able to login to an existing account
  
  Background:
    Given the following users:
    | email               | password   |
    | my_email@domain.com | 1234567890 |
  
  Scenario: Login existing user
    Given I am on the login user page
    Then I should not see "Login" within "a"
    When I fill in "Email" with "my_email@domain.com"
     And I fill in "Password" with "1234567890"
     And I press "Login"
    Then I should see a flash notice "You have logged in successfully."
     And I should see "You are logged in as my_email@domain.com."
