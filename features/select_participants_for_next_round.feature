Feature: select participants for next rounds
As an admin
So that I can choose participants based upon their scores to next rounds
I want to select participants to promote them to next round

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
 | Ana    | mine     | 9798765431 | ana@tamu.edu  | Texas |

Given the following qualifications exist:
 | participant_id | round_id | participant_number |
 | 1              | 1        | 1                  |


Scenario: select participants for next rounds
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I follow "Senior"
  And I follow "Senior's Rounds"
  And I follow "Interview"
  And I follow "Send to Next Round"
  When I check "arr_part_"
  And I fill in "participant_number_1" with "14"
  And I choose "first_round_1"
  And I press "Submit"
  Then I should be on QUALIFICATIONS INDEX
  And I should see "Ana"
  And I should see "9798765431"
 
