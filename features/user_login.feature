Feature: Login existing user
  In order to have the site remember an individual's details and so grow a user base
  a user
  wants to be able to login to an existing account
  
  Background:
    Given the following users:
    | email               | password   |
    | my_email@domain.com | 1234567890 |
  
  Scenario Outline: Login existing user
    Given I am on the login user page
    Then I should not see "Login" within "a"
     And I should not see "Sign up"
     And I should not see "Sign in"
    When I fill in "Email" with "my_email@domain.com"
     And I fill in "Password" with "1234567890"
     And I <check_or_dont> "Remember me"
     And I press "Login"
    Then I should see a flash notice "You have logged in successfully."
     And I should see "You are logged in as my_email@domain.com."
     And I should be on my show user page
    When I restart my browser
     And I am on my show user page
    Then I should be on <final_page>
     And I <should_or_not> see "You need to login or register before continuing"
     
     Examples:
     | check_or_dont | final_page          | should_or_not |
     | check         | my show user page   | should not    |
     | uncheck       | the login user page | should        |
