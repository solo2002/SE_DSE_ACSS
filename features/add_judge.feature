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

Given the following users exist:
 | email_id 				| password_digest  	     | is_admin |
 | admin@admin.com      	| adminpass    			 | 1        |
 | judge@judge.com      	| judgepass    			 | 0        |  
 
Given the following judges exist:
 | j_name | j_loc | j_phone    | j_des | password    | j_email         |
 | Lance  | Texas | 1234567898 | judge | judgepass    | judge@judge.com |
 
Scenario: add judges to the competition
  Given I am logged in as Admin 
  Given I am on the Competitions page
  When I follow "Judges"
  And I follow "Add Judge"
  And I fill in "Name:" with "Judge1"
  And I fill in "Location" with "Texas"
  And I fill in "Phone" with "1234567979"
  And I fill in "Email" with "judge1@gmail.com"
  And I fill in "Description" with "Judge number 2"
  And I fill in "Password" with "judge123"
  And I press "Save Changes"
  Then I should be on the Details about "Judge1" page
  When I check the following competitions: Ringman
  When I uncheck the following competitions: Rookie, Senior, Champion
  And I press "Submit"
  Then I should be on Judges
  When I follow "Judge1"
  Then I should be on the Details about "Judge1" page
  And I should see "Judge1"
  Then I should see Judge Name "Judge1"
  Then I should see Location "Texas"
  Then I should see Email "judge1@gmail.com"
  
   
  
  
 
