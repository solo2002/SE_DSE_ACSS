Feature: sort judges by name
As an admin
So that I can see the judges on the basis of their names 
I want to sort judges by their name

Background: judges have been added to database

Given the following judges exist:
 | j_name           | j_phone                   |j_loc            | j_email              | j_des                    | password |
 | A_Judge          |  1111111111               |College station  |a@gmail.com           | Competition for Rookie   | aaaaaa   |
 | B_Judge          |  2222222222               |Texas            |b@gmail.com           | Competition for Ringman  | bbbbbb   |
 | C_Judge          |  3333333333               |California       |c@gmail.com           | Competition for Senior   | cccccc   | 
 | D_Judge          |  4444444444               | Denver          | d@gmail.com          | Competition for champion | dddddd   |

Given the following users exist:
 | email_id 				| password_digest  	     | is_admin |
 | admin@admin.com      	| adminpass    			 | 1        |
 | judge@judge.com      	| judgepass    			 | 0        |  
 
Scenario: sort judges by name to the competition
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I go to Judges
  When I follow "Name"
  Then I should see "A_Judge" before "B_Judge"
  Then I should see "B_Judge" before "C_Judge"
  And I should see "C_Judge" before "D_Judge"
   
  
  
 
