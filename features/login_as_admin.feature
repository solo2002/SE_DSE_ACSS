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

Given the following users exist:
 | email_id 				| password_digest  	     | is_admin |
 | admin@admin.com      	| adminpass    			 | 1        |
 | judge@judge.com      	| judgepass    			 | 0        | 

Scenario: login in the page as admin
  Given I am on Welcome page
  When I fill in "cred_email_id" with "admin@admin.com"
  When I fill in "cred_password" with "adminpass"
  And I press "Login"
  Then I should be on the Competitions page
  

  
Scenario: login in the page as invalid admin
  Given I am on Welcome page
  When I fill in "cred_email_id" with "admin@admin.com"
  When I fill in "cred_password" with "somepass"
  And I press "Login"
  Then I should see "Invalid email/password combination" 
 
Scenario: Logout as a admin
  Given I am logged in as Admin
  When I follow "Logout"
  Then I should be on Welcome page