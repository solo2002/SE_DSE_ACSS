class User < ActiveRecord::Base
  has_secure_password

  validates :email_id, presence: true
  validates :password_digest, presence: true
  validates :is_admin, presence: true
=begin
  def self.valid(user, password)
    if user.email_id=="admin"
      user.is_admin= 1;
    else
      user.is_admin= 0;
    end
    if user && (user.password_digest == password)
      return true
    else
      return false
    end
  end
=end
def encrypt(user)
if self.email_id=="admin"
  user.password_digest= BCrypt::Password.create("admin")
else
  user.password_digest= BCrypt::Password.create(password_digest)
end 
puts user.password_digest
end

#def self.encrypt_bcrypt(text)
 # BCrypt::Password.create text
#end



end
