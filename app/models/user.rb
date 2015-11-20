class User < ActiveRecord::Base
  has_secure_password

  #validates :email_id, presence: true
  #validates :password_digest, presence: true
  validates :is_admin, presence: true
  
def encrypt(user)
  user.password_digest= BCrypt::Password.create(password_digest)
end

  before_save { self.email_id = email_id.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email_id, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password_digest, length: { minimum: 6 }, allow_blank: true

  

end
