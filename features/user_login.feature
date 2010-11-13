Feature: Login existing user
  In order to have the site remember an individual's details and so grow a user base
  a user
  wants to be able to login to an existing account
  
  Background:
    Given the following users:
    | email               |
    | my_email@domain.com |
  
  Scenario: Login existing user
    Given I am on the login page
    When I fill in "Email" with "my_email@domain.com"
    And I press "Login"
    Then I should see "Welcome my_email@domain.com."
     And I should see a flash message "You are logged in."
