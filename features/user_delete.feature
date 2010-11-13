Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  @wip
  Scenario: Delete user
    Given the following users:
      |email|
      |email 1|
      |email 2|
      |email 3|
      |email 4|
    When I delete the 3rd user
    Then I should see the following users:
      |Email|
      |email 1|
      |email 2|
      |email 4|
