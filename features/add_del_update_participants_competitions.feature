Feature: add participants, competitions and rounds
 
  As an admin
  So that I can quickly add and delete participants competitions and rounds
  I want to manage participant and judges for a competition

Background: 
	Given I am logged in as Admin

Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |
 | Ringman          | Competition for Ringman   | 3            |
 | Senior           | Competition for Senior    | 3            |
 | Champion         | Competition for champion  | 3            |

And  I am on the Competitions page

Scenario: add new competition
  When I follow "Add New Competition"
  And I fill in "Competition name" with "Champion"
  And I fill in "Competition des" with "Competition for Champion"
  And I press "Submit"
  #Then I should see "Details about Competition"
  And the "Competition name" field should contain "Champion"
  And the "Competition des" field should contain "Competition for Champion"

Scenario: add new participant
  When I follow "See All Participants"
  And I follow "Add Participant"
  And  I fill in "Name" with "Ana"
  And  I fill in "Location" with "Texas"
  And  I fill in "Phone" with "9798765432"
  And  I fill in "Email" with "ana@tamu.edu"
  And  I fill in "Description" with "mine"
  And I press "Save Changes"
  Then I should see Details about Participant "name"
  Then I should see Name "Ana"
  Then I should see Location "Texas"
  Then I should see Phone "9798765432"
  Then I should see Email "ana@tamu.edu"
  Then I should see Description "mine"


Scenario: add rounds for each competition
 When I follow "Rookie"
 And I follow "Rounds"
 And I follow "Add Round"
 And I fill in "Round name" with "Second"
 And I fill in "Round des" with "The second round"
 And I press "Submit"
 Then I should see Details about Round "Second"
 Then I should see Round Name "Second"
 Then I should see Description "The second round"


