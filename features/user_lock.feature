Feature: Lock user after failed login attempts
  In order to have a reputation for security and protect users privacy
  a user
  wants their account locked after a number of failed login attempts, and to unlock it easily
  
  Background:
    Given the following confirmed users:
    | email               | password   |
    | my_email@domain.com | 1234567890 |
  
  Scenario: Lock existing user
    Given I am on the login user page
      And a clear email queue
     When I unsuccessfully login 11 times
     Then I should see "Your account is locked due to too many invalid logins. You've been sent an email with instructions for unlocking it, otherwise it will be unlocked automatically after one hour."
      And my account should be locked
      And I should be on the login user page
      And I should receive an email
     When I open the email 
     Then I should see "Unlock Your Account" in the email subject
      And I should see "Your account has been locked due to an excessive amount of unsuccessful login attempts." in the email body
     When I follow "Unlock my account" in the email
     Then I should be on my user show page
      And I should see a flash notice "Your account was successfully unlocked"
