Feature: sort judges by name
As an admin
So that I can see the judges on the basis of their names 
I want to sort judges by their name

Background: judges have been added to database

Given the following judges exist:
 | j_name           | j_phone                   | j_email              | j_des                    | password |
 | A                |  1111111111               | a@gmail.com          | Competition for Rookie   | aaaaaa   |
 | B                |  2222222222               | b@gmail.com          | Competition for Ringman  | bbbbbb   |
 | C                |  3333333333               | c@gmail.com          | Competition for Senior   | cccccc   | 
 | D                |  4444444444               | d@gmail.com          | Competition for champion | dddddd   |


Scenario: sort judges by name to the competition
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I go to Judges
  When I follow "Name"
  Then I should see "A"
  Then I should see "B"
  And I should see "C"
  And I should see "D"
   
  
  
 
