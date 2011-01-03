Feature: Edit user
  In order to keep users data up to date
  a user
  wants to be able to edit her data
  
  Background:
    Given the following users:
     | email               | password   |
     | my_email@domain.com | 1234567890 |
     And I am logged in as them
  
  Scenario: Edit user data
    When I follow "Edit"
    Then I should be on my edit user page
    When I fill in "Email" with "my_other_email@domain.com"
     And press "Update User"
    Then I should be on my show user page
     And I should see a flash notice "Your details were successfully updated."
     And I should see "my_other_email@domain.com" within ".main_section"

  Scenario: Edit user data
    When I follow "My info"
    Then I should be on my edit user page
    When I follow "Back"
    Then the page I'm on should match my show user page
    When I am on the index users page
    Then I should see "my_email@domain.com"
    
  Scenario: Edit password
    When I follow "My info"
    Then I should be on my edit user page
    When I follow "Change password"
    Then I should be on the edit user registration page
    When I fill in "Password" with "0987654321"
     And I fill in "Password confirmation" with "0987654321"
     And I fill in "Current password" with "1234567890"
     And I press "Update"
    Then I should be on my show user page
     And I should see "You updated your account successfully."
    When I follow "Logout"
    Then I should be on the user login page
    When I fill in "Email" with "my_email@domain.com"
     And I fill in "Password" with "0987654321"
     And I press "Login"
    Then I should see a flash notice "You have logged in successfully."
     And I should see "You are logged in as my_email@domain.com."
     And I should be on my show user page
