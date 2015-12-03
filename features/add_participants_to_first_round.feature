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

Scenario: add participants to the first round
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I go to SENIOR
  When I go to ENROLLED PARTICIPANTS
  When I go to ADD PARTICIPANTS TO FIRST ROUND
  When I check Select
  And I fill in "Part Number" with 14
  And I check First
  And I press "Add Participants To Round"
  Then I am on "PARTICIPANTS FOR ROUND FIRST" Page 
 
