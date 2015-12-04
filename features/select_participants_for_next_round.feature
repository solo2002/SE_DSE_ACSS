Feature: select participants for next rounds
As an admin
I want to select participants to promote them to next round
So selected participants can go to next round


Background: competitions have been added to database

Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |
 | Ringman          | Competition for Ringman   | 3            |
 | Senior           | Competition for Senior    | 3            |
 | Champion         | Competition for champion  | 3            |
 
 
Given the following rounds exist:
  | competition_id | round_name       | round_des            |
  | 3              | Interview        | Interview for senior |
  | 3              | Dance            | Dance for senior     |
  
Given the following participants exist:
 | p_name | p_des    | p_phone    | p_email       | p_loc |
 | Ana    | Desc     | 9798765431 | ana@tamu.edu  | Texas |
 | Mika   | Desc     | 9798765432 | mika@tamu.edu | Texas |

Given the following qualifications exist:
 | participant_id | round_id | participant_number |
 | 1              | 1        | 1                  |
 | 2              | 1        | 2                  |


Scenario: select participants for next rounds
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I follow "Senior"
  And I follow "Senior's Rounds"
  And I follow "Interview"
  And I follow "Send to Next Round"
  And I press "Add Participants To Round"
  Then I should see "No participant to qualify"
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
 
