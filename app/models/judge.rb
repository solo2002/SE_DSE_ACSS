class Judge < ActiveRecord::Base
	has_and_belongs_to_many :competitions
        has_many :scores
  before_save { self.j_email = j_email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
validates :j_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  VALID_PHONE_REGEX = /^[0-9]*$/

  validates :j_phone, presence: true, length: {is: 10},
                    format: { with: VALID_PHONE_REGEX, :multiline =>true },
                    uniqueness: { case_sensitive: false }


  #VALID_PHONE_REGEX = /(\d)*/ 

  #validates :j_phone, presence: true, length: { in: 0..10},
  #                  format: { with: VALID_PHONE_REGEX }
		
end
