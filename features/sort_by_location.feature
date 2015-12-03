Feature: sort judges by location
As an admin
So that I can see the judges on the basis of their location 
I want to sort judges by their location

Background: judges have been added to database

Given the following judges exist:
 | j_name           | j_phone                   |j_loc            | j_email              | j_des                    | password |
 | A_Judge          |  1111111111               |College station  |a@gmail.com           | Competition for Rookie   | aaaaaa   |
 | B_Judge          |  2222222222               |Texas            |b@gmail.com           | Competition for Ringman  | bbbbbb   |
 | C_Judge          |  3333333333               |California       |c@gmail.com           | Competition for Senior   | cccccc   | 
 | D_Judge          |  4444444444               | Denver          | d@gmail.com          | Competition for champion | dddddd   |


Scenario: sort judges by location to the competition
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I go to Judges
  When I follow "Location"
  Then I should see "C_Judge" before "A_Judge"
  Then I should see "A_Judge" before "D_Judge"
  And I should see "D_Judge" before "B_Judge"
   
  
  
 
