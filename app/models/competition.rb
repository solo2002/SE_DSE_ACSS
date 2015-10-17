class Competition < ActiveRecord::Base
	has_and_belongs_to_many :judges
	has_many :rounds
	has_many :participants, through: :enrollments
end
