FactoryGirl.define do
  factory :user do |u|
    u.email_id "user@user.com"
    u.password_digest "very_complex_pass"
    u.is_admin 1
    
  end
end

