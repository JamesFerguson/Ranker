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
    Given I am on my show user page
    Then I should see my email in the "Email" field
     And I should see my login time in the "Login Time" field
    
    # should do:
    # - user_current_sign_in_at_input
    # - user_last_sign_in_at_input
    # - confirmed? - user_confirmed_at_1i
    # - user_confirmation_sent_at_input
    # - created_at
    
    # could do:
    # - updated at
    # - remember me expires
    # - failed login attempts (admin)
    # - locked at (admin)
    # - ips (admin)