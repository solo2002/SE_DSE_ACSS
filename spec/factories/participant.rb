FactoryGirl.define do
  factory :participant do |p|
    p.p_name "Adam"
    p.p_loc "Texas"
    p.p_phone 1234567890
    p.p_email "adam@eve.com"
    p.p_des "test participant 1"
    p.password "complex_pass"
    end
end
