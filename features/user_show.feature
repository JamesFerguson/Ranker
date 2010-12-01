Feature: Logout user
  In order to protect users data
  a user
  wants to be able to logout of the site
  
  Background:
    Given the following users:
     | email               | password   |
     | my_email@domain.com | 1234567890 |
     And I am logged in as them
  
  Scenario: Logout user and ensure logged out user doesn't have access to user data
    Then I should see "my_email@domain.com"