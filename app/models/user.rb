class User < ActiveRecord::Base
  #has_secure_password

  validates :email_id, presence: true
  validates :password_digest, presence: true
  validates :is_admin, presence: true

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


end
