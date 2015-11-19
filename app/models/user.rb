class User < ActiveRecord::Base
  has_secure_password

  validates :email_id, presence: true
  validates :password_digest, presence: true
  validates :is_admin, presence: true
  
def encrypt(user)
  user.password_digest= BCrypt::Password.create(password_digest)
end

end
