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

Given the following enrollments exist:
 | participant_id | competition_id |
 | 1              | 3              |

Given the following rounds exist:
 | competition_id | round_name       | round_des            |
 | 3              | Interview        | Interview for senior |



Scenario: add participants to the first round
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I follow "Senior"
  When I follow "Enrolled participants"
  When I go to ADD PARTICIPANTS TO FIRST ROUND
  When I check "arr_part_"
  And I fill in "participant_number_1" with "14"
  And I choose "first_round_1"
  And I press "Add Participants To Round"
  Then I should be on QUALIFICATIONS INDEX
  And I should see "Ana"
  And I should see "9798765431"
 
