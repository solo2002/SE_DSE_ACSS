Feature: add judges by assigning their email address and password
As an admin
So that I can add judges to the competitions to give scores 
I want to authenticate judges by giving passwords to their unique email address

Background: competitions have been added to database

Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |
 | Ringman          | Competition for Ringman   | 3            |
 | Senior           | Competition for Senior    | 3            |
 | Champion         | Competition for champion  | 3            |


Scenario: add judges to the competition
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I go to Judges
  When I go to Add Judge
  And I fill in "Name:" with "Judge1"
  And I fill in "Location" with "Texas"
  And I fill in "Phone" with "1234567979"
  And I fill in "Email" with "judge1@gmail.com"
  And I fill in "Description" with "Judge number 2"
  And I fill in "Password" with "judge123"
  And I press "Save Changes"
  Then I am on the Details about "Judge1" page
  When I check the following competitions: Ringman
  When I uncheck the following competitions: Rookie, Senior, Champion
  And I press "Submit"
  Then I go to Judges
  
   
  
  
 
