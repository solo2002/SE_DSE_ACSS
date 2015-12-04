Feature: View Report
As an admin
I should be able to view score of participant
So that I can print it and send it to them

Background: competitions have been added to database

Given the following competitions exist:
 | competition_name | competition_des           | no_of_rounds |
 | Rookie           | Competition for Rookie    | 3            |
 | Ringman          | Competition for Ringman   | 3            |
 | Senior           | Competition for Senior    | 3            |
 | Champion         | Competition for champion  | 3            |
 
 
Given the following rounds exist:
  | competition_id | round_name       | round_des            |
  | 3              | Interview        | Interview for senior |
  | 3              | Dance            | Dance for senior     |
  
Given the following participants exist:
 | p_name | p_des    | p_phone    | p_email       | p_loc |
 | Ana    | mine     | 9798765431 | ana@tamu.edu  | Texas |

Given the following qualifications exist:
 | participant_id | round_id | participant_number |
 | 1              | 1        | 1                  |

Given the following enrollments exist:
 | participant_id | competition_id |
 | 1              | 3              |
 
Given the following judges exist:
 | j_name | j_loc | j_phone    | j_des | password    | j_email         |
 | Lance  | Texas | 1234567898 | judge | judge123    | judge@judge.com |
 
Given the following competition judges exist:
 | competition_id | judge_id |
 | 3              | 1        |
 
Given the following questions exist:
 | question_details     | marks | round_id    | category  |
 | Interview for Senior | 10    | 1           | Interview |

Given the following scores exist:
 | participant_id | round_id | judge_id | question_id | marks | question_comment |
 | 1              | 1        | 1        | 1           | 9     | He is fine       |
 
Given the following comments exist:
 | participant_id | round_id | judge_id | comment_des      |
 | 1              | 1        | 1        | He is good       |
 
And  I am on the Competitions page
 
Scenario: see report of participant
Given I am logged in as Admin
When I follow "See All Participants"
And I follow "Ana"
And I follow "Generate Report"
Then I should be on Report of participant "Ana"
And I should see "Ana"
And I should see "Lance"
And I should see "Interview"
And I should see "9"
And I should see "He is good"

Scenario: see report of participant for a question
Given I am logged in as Admin
When I follow "See All Participants"
And I follow "Ana"
And I follow "Interview for Senior"
Then I should be on Report of participant "Ana" and round "Interview" and question "Interview for Senior"
And I should see "Lance"
And I should see "9"
And I should see "He is fine"


