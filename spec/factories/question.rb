FactoryGirl.define do
  factory :question do |q|
    q.question_details "is he standing straight"
    q.marks 10
    q.round_id 1
    q.category "Posture"
    
  end
end
  
