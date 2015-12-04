Feature: add participants, competitions and rounds
 
  As an admin
  So that I can quickly add and delete participants competitions and rounds
  I want to manage participant and judges for a competition

Background: 


Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |


Given the following participants exist:
 | p_name | p_des    | p_phone    | p_email       | p_loc |
 | Ana    | Ana des  | 9798765431 | ana@tamu.edu  | Texas |
 
Given the following rounds exist:
  | competition_id | round_name       | round_des            |
  | 1              | Interview        | Interview for senior |
  | 1              | Dance            | Dance for senior     |

Given the following users exist:
 | email_id 				| password_digest  	     | is_admin |
 | admin@admin.com      	| adminpass    			 | 1        |
 | judge@judge.com      	| judgepass    			 | 0        |  
 
Given the following judges exist:
 | j_name | j_loc | j_phone    | j_des | password    | j_email         |
 | Lance  | Texas | 1234567898 | judge | judgepass    | judge@judge.com |

Given I am logged in as Admin
And  I am on the Competitions page

Scenario: add new competition
  When I follow "Add New Competition"
  And I fill in "Competition name" with "Champion"
  And I fill in "Competition des" with "Competition for Champion"
  And I press "Submit"
  Then I should be on the Details about Competition "Champion"
  And I should see "Champion"
  And I should see "Competition for Champion"

 
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

 
Scenario: Delete an existing Competition
 When I press first "comp_delete" Image
 Then I should be on the Competitions page
 And I should not see "Competition for Rookie"
 
Scenario: Delete an existing Participant
 When I follow "See All Participants"
 And I press first "comp_delete" Image
 Then I should be on the Participants page
 And I should not see "Ana des"

Scenario: Delete an existing Round
 When I follow "Rookie"
 And I follow "Rookie's Rounds"
 And I press first "comp_delete" Image
 Then I should be on Rounds of "Rookie" page
 And I should not see "Interview for Senior"
  

 
 

