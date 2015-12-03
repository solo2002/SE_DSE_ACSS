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
 
Given the following rounds exist:
 | competition_id | round_name       | round_des            |
 | 1              | Interview        | Interview for senior |

Scenario: add questions to the rounds
  Given I am logged in as Admin 
  When I follow "Rookie"
  When I follow "Rookie's Rounds"
  When I follow "Interview"
  When I follow "Questions"
  When I follow "Add Question"
  And I fill in "Category" with "Interview"
  And I fill in "Question details" with "Interview for Rookie"
  And I fill in "Marks" with "10"
  And I press "Submit"
  Then should be on QUESTIONS INDEX
  And I should see "Interview for Rookie"
  
   
  
  
 