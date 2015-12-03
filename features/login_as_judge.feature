Feature: login for the admin with username and password
As an admin
So that I can see all the competitions, their rounds and manage all the operations
I want to authenticate myself by using my username and password

Background: competitions have been added to database

Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |
 | Ringman          | Competition for Ringman   | 3            |
 | Senior           | Competition for Senior    | 3            |
 | Champion         | Competition for champion  | 3            |


Scenario: login in the page as judge
  Given I am on Welcome page
  When I fill in "cred_email_id" with "judge1"
  When I fill in "cred_password" with "judge"
  And I press "submit"
  Then I go to the Competitions page 
  
  
 
