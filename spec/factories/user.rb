FactoryGirl.define do
  factory :user do |u|
    u.email_id "user@user.com"
    u.password_digest "very_complex_pass"
    u.is_admin 1
    
  end
  factory :judgeuser , parent: "user" do |ju|
    ju.email_id "eve@adam.com"
    ju.password_digest "very_complex_pass"
    ju.is_admin 0
    
  end
end

