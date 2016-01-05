Feature: Judge scores and comments on participant
As a judge
I should be able to login and select participants
So that I can score and comment on them

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
 | p_name | p_des       | p_phone    | p_email       | p_loc |
 | Ana    | Ana Des     | 9798765431 | ana@tamu.edu  | Texas |

Given the following qualifications exist:
 | participant_id | round_id | participant_number |
 | 1              | 1        | 1                  |

Given the following enrollments exist:
 | participant_id | competition_id |
 | 1              | 3              |
 
Given the following judges exist:
 | j_name | j_loc | j_phone    | j_des | password     | j_email         |
 | Lance  | Texas | 1234567898 | judge | judgepass    | judge@judge.com |
 
 Given the following users exist:
 | email_id        | password_digest | is_admin |
 | judge@judge.com | judgepass       | 0        |
 
Given the following competition judges exist:
 | competition_id | judge_id |
 | 3              | 1        |
 
Given the following questions exist:
 | question_details     | marks | round_id    | category  |
 | Interview for Senior | 10    | 1           | Interview |
 
 Scenario: Judge logs in and scores participant
 Given I am logged in as Judge
 When I follow "Senior"
 And I follow "Interview"
 And I follow "1"
 And I fill in "scores_" with "9"
 And I fill in "question_comments_1" with "Ana spoke well"
 And I press "Submit Scores"
 Then I should be on New Comments of "Senior" competition and "Interview" round and "1" qualification
 When I fill in "comment_comment_des" with "Overall Ana was good"
 And I press "Comment"
 Then I should be on Qualifications page of "Senior" competition and "Interview" round
 And I should not see "1"
 
