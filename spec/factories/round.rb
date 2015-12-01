FactoryGirl.define do
  factory :round do |r|
    r.round_name "round_one"
    r.round_des "prelims round for champion"
    r.no_of_participants 3
    r.competition_id 1
    
  end
  factory :round2, parent: "round" do |r|
    r.round_name "round_two"
    r.round_des "second round for champion"
    
  end
end

