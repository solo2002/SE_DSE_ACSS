class Participant < ActiveRecord::Base
	has_many :enrollments
	has_many :competitions, through: :enrollments
	has_many :qualifications
	has_many :rounds, through: :qualifications
	has_many :scores	
	validates :p_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

validates :p_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  VALID_PHONE_REGEX = /^[0-9]*$/

  validates :p_phone, presence: true, length: {is: 10},
                    format: { with: VALID_PHONE_REGEX, :multiline =>true },
                    uniqueness: { case_sensitive: false }





end

