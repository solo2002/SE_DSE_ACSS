Feature: add questions and scores for rounds
As an admin
So that I can give separate scores to the participants for each rounds 
I want to add questions to each rounds

Background: competitions have been added to database

Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |
 | Ringman          | Competition for Ringman   | 3            |
 | Senior           | Competition for Senior    | 3            |
 | Champion         | Competition for champion  | 3            |

Scenario: add questions and scores for each questions to the rounds
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I go to ROOKIE
  When I go to Rounds
  When I go to FIRST
  When I go to QUESTIONS
  When I go to ADD QUESTION
  And I fill in "Category" with "1"
  And I fill in "QUESTION DETAILS" with "GREETINGS"
  And I fill in "MARKS" with "10"
  And I press "SUBMIT"
  Then I am on QUESTIONS FOR FIRST page
   
  
  
 