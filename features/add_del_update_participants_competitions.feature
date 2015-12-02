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
  When I go to Add New Competition page
  And I fill in Competition name with "Champion"
  And I fill in "Competition des" with "Competition for Champion"
  And I press "Submit"
  Then I should see Competition Name "Champion"
  Then I should see Competition Description "Competition for Champion"

Scenario: add new participant
  When I follow "See All Participants"
  And I go to the Participant page
  When I go to the Participant page
  And I follow "Add Participants"
  And  I fill in "Name" with "Ana"
  And  I fill in "Location" with "Texas"
  And  I fill in "Phone" with "979"
  And  I fill in "Email" with "@tamu.edu"
  And  I fill in "Description" with "mine"
  And I press "Save Changes"
  Then I should see Details about Participant "name"
  Then I should see Name "Ana"
  Then I should see Location "Texas"
  Then I should see Phone "979"
  Then I should see Email "@tamu.edu"
  Then I should see Description "mine"

Scenario: add rounds for each competition
 When I go to "ROOKIE"
 And I follow "Rounds"
 And I follow "Add Round"
 And I fill in "Round name" with "Second"
 And I fill in "Round des" with "The second round"
 And I fill in "No of participants" with "30"
 And I press "Submit"
 Then I should see Details about Round "Second"
 Then I should see Round Name "Second"
 Then I should see Round Des "The second round"
 Then I should see No of participants "30"


