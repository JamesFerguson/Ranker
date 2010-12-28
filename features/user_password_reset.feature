Feature: Reset logged out user password via email
  In order to keep users who can't remember a simple password and so maintain a user base
  a user
  wants to be able to request a password reset
  
  Background:
    Given the following users:
    | email               | password   |
    | my_email@domain.com | 1234567890 |
      And a clear email queue
  
  Scenario Outline: Reset password while logged out
    Given I am on the new user password page
     When I fill in "Email" with "<email>"
      And I press "Send me reset password instructions"
     Then I should receive an email
     When I open the email with subject "Reset password instructions"
     Then I should see "Someone has requested a link to change your password, and you can do this through the link below." in the email body
     When I follow "Change my password" in the email
     Then I should be on the edit user password page
     When I fill in "Password" with "<new_password>"
      And I fill in "Password confirmation" with "<new_password>"
      And I press "Change my password"
     Then I should be on my show user page
      And I should see a flash notice "Your password was changed successfully. You are now logged in."
     When I follow "Logout"
      And I am on the login user page
      And I fill in "Email" with "<email>"
      And I fill in "Password" with "<new_password>"
      And I press "Login"
     Then I should see a flash notice "You have logged in successfully."

      Examples:
      | email               | new_password |
      | my_email@domain.com | 0987654321   |