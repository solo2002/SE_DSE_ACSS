FactoryGirl.define do
  factory :score do |s|
    s.participant_id 1
    s.judge_id 1
    s.round_id 1
    s.question_id 1
    s.marks 10
    s.question_comment "Gajab aadmi tha ye to"
    
  end
end


