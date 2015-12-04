Feature: add participants to the first round
As an admin
So that I can manage all the participants competition
I want to add participants to the first round by default

Background: competitions have been added to database

Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |
 | Ringman          | Competition for Ringman   | 3            |
 | Senior           | Competition for Senior    | 3            |
 | Champion         | Competition for champion  | 3            |
 
Given the following participants exist:
 | p_name | p_des    | p_phone    | p_email       | p_loc |
 | Ana    | mine     | 9798765431 | ana@tamu.edu  | Texas |
 | Mika   | Desc     | 9798765432 | mika@tamu.edu | Texas |

Given the following enrollments exist:
 | participant_id | competition_id |
 | 1              | 3              |
 | 2              | 3              |

Given the following users exist:
 | email_id 				| password_digest  	     | is_admin |
 | admin@admin.com      	| adminpass    			 | 1        |
 | judge@judge.com      	| judgepass    			 | 0        |  
 
Given the following judges exist:
 | j_name | j_loc | j_phone    | j_des | password    | j_email         |
 | Lance  | Texas | 1234567898 | judge | judgepass    | judge@judge.com |

Scenario: Add participants when there are no rounds
 Given I am logged in as Admin 
 Given I am on the Competitions page
 When I follow "Senior"
 And I follow "Enrolled participants"
 And I follow "Add to First Round"
 And I press "Add Participants To Round"
 Then I should be on Rounds of "Senior" page
 Then I should see "Add Rounds by clicking 'Add Round' and then Qualify participants"




Scenario: add participants to the first round
Given the following rounds exist:
 | competition_id | round_name       | round_des            |
 | 3              | Interview        | Interview for senior |
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I follow "Senior"
  And I follow "Enrolled participants"
  And I follow "Add to First Round"
  And I press "Add Participants To Round"
  Then I should see "Select at least one participant to qualify"
  When I check "selected_participants_1"
  And I press "Add Participants To Round"
  Then I should see "Enter Contestant Number for each selected Participants!"
  When I fill in "contestant_number_1" with "14"
  And I check "selected_participants_1"
  And I fill in "contestant_number_2" with "2"
  And I press "Add Participants To Round"
  Then I should see "Select Participant for all the participants for whom contestant number is given!"
  When I check "selected_participants_1"
  And I fill in "contestant_number_1" with "14"
  When I check "selected_participants_2"
  And I fill in "contestant_number_2" with "14"
  And I press "Add Participants To Round"
  Then I should see "Please give unique Contestant number to each participant"
  When I check "selected_participants_1"
  And I fill in "contestant_number_1" with "14"
  And I choose "first_round_1"
  And I press "Add Participants To Round"
  Then I should be on Qualifications of "Senior" competition and "Interview" round
  And I should see "Ana"
  And I should see "9798765431"
 
