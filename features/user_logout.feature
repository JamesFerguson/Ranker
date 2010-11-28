Feature: Logout user
  In order to protect users data
  a user
  wants to be able to logout of the site
  
  Background:
    Given I am on the homepage
     And the following users:
     | email               | password   |
     | my_email@domain.com | 1234567890 |
     And I am logged in as them
  
  Scenario: Logout user and ensure logged out user doesn't have access to user data
    When I follow "Logout"
    Then I should see a flash notice "You have logged out successfully."
     And I should not see "You are logged in as my_email@domain.com."
    When I go to the edit user registration page
    Then I should be on the login user page
     And I should see "You need to login or register before continuing."
