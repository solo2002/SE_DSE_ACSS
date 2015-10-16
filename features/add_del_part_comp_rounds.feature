Feature: add and edit competition, rounds and participants
 
  As an admin
  So that I can quickly add competition, rounds and participants
  I want to see manage competition, rounds and participants for a competition

Background: Competitions have been added to database

Given the following competitions exist:
  | competition_name        | competition_des  | no_of_rounds |
  | Rookie                  | Comp 1           | 3            |
  | Ringman                 | Comp 2           | 3            |
  | Senior                  | Comp 3           | 3            |
  | Champion                | Comp 4           | 3            |
  
And I am on the Current Rounds home page
  
Scenario: add competition
  When I follow "Add Competition"
  And I fill in "Competition name" with "Junior"
  And I fill in "Competition des" with "Comp 5"
  And I fill in "No of rounds" with "3"
  And I press "Submit"
  And I am on the Details about Junior home page

Scenario: add participant
  When I follow "Participants"
  And I follow "Add Participants"
  And I fill in "Name" with "Nikita"
  And I fill in "Location" with "Texas"
  And I fill in "Phone" with "456"
  And I fill in "Description" with "Good"
  And I press "Save Changes"
  And I am on the Details about Nikita home page

Scenario: add rounds for each competition
  When I follow "Rookie"
  And I follow "Rounds"
  And I follow "Add Round"
  And I fill in "Round name" with "Second"
  And I fill in "Round des" with "The second round"
  And I fill in "No of participants" with "30"
  And I press "Submit"
  And I am on the Details about Second home page

