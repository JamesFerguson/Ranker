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
     And I am the user with email "my_email@domain.com"
     And I should be on my show user page
     And I should receive an email
    When I open the email 
    Then I should see "Confirm your registration" in the email subject
     And I should see "confirm your account" in the email body
    When I follow "confirm your account" in the email
    Then I should be on my user show page
     And I should see a flash notice "Your account was successfully confirmed"
     And I should see "less than a minute ago" within ".confirmed_at_user"

  Scenario: Resend confirmation email
    Given the following users:
     | email               | password   |
     | my_email@domain.com | 1234567890 |
      And a clear email queue
      And I am on the user login page
    When I follow "Didn't receive confirmation instructions?"
    Then I should be on the new user confirmation page
    When I fill in "Email" with "my_email@domain.com"
     And I press "Resend confirmation instructions"
    Then I should be on the user login page
     And I should see a flash notice "You will receive an email with instructions about how to confirm your account in a few minutes."
     And I should receive an email
    When I open the email 
    Then I should see "Confirm your registration" in the email subject
     And I should see "confirm your account" in the email body
    When I follow "confirm your account" in the email
    Then I should be on my user show page
     And I should see a flash notice "Your account was successfully confirmed"
     And I should see "less than a minute ago" within ".confirmed_at_user"
