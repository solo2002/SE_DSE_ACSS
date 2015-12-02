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

Scenario: select participants for next rounds
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I go to "ROOKIE"
  When I go to GO TO ROOKIE'S ROUNDS
  When I go to FIRST
  Then I am on DETAILS ABOUT FIRST page
  When I go to SELECT PARTICIPANTS FOR THE NEXT ROUND
  When I check Select
  And I fill in "Contestant Number" with 3
  And I check Second
  And I press "SUBMIT"
  Then I am on "PARTICIPANTS FOR ROUND SECOND" Page 
 
