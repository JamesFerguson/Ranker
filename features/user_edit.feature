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
