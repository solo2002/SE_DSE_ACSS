class Participant < ActiveRecord::Base
	has_many :enrollments
	has_many :competitions, through: :enrollments
	has_many :qualifications
	has_many :rounds, through: :qualifications
	has_many :scores
end
