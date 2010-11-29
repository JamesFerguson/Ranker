Feature: correctly route to the homepage
  In order to easily navigate the site
  a user
  wants to hit the login page by default if logged out or else their member page
  
  Scenario: Check the homepage route
    Given I am on the home page
    Then I should be on the login user page
    Given the following users:
     | email               | password   |
     | my_email@domain.com | 1234567890 |
     And I am logged in as them
     And I am on the homepage
    Then the page I'm on should match the show user page for the user with the email "my_email@domain.com"
