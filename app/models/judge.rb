class Judge < ActiveRecord::Base
	has_and_belongs_to_many :competitions
        has_many :scores
  before_save { self.j_email = j_email.downcase }
  	#validates :j_name, presence: true
	validates :j_name, presence: { message: "Judge name is required" }
	#validates :j_name, 
	#	  :presence => {:message=> "Enter judge name"}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
validates :j_email, presence: {message: "email can't be blank"}, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX , message: "email format must be abc@def.ghi" },
                    uniqueness: { case_sensitive: false, message: "email already exists" }
  #has_secure_password
  #validates :password, length: { minimum: 6 }, allow_blank: true
   validates :password,presence: {message: "password field can't be blank"},
             :length=> {:minimum=> 6, :message=> "Must be less than 6 characters"}

  VALID_PHONE_REGEX = /^[0-9]*$/

  validates :j_phone, presence:{message: "Phone number must be 10 digits"}, 
	     length: {is: 10},
             format: { with: VALID_PHONE_REGEX, :multiline =>true },
             uniqueness: { case_sensitive: false, message: "phone number already exists" }


  #VALID_PHONE_REGEX = /(\d)*/ 

  #validates :j_phone, presence: true, length: { in: 0..10},
  #                  format: { with: VALID_PHONE_REGEX }
		
end
