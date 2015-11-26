class Competition < ActiveRecord::Base
	has_and_belongs_to_many :judges
	has_many :rounds
	
	has_many :enrollments
	has_many :participants, through: :enrollments
	validates :competition_name, presence: { message: "Competition name is required" },uniqueness: { case_sensitive: false, message: "Competition name already exists" }
	validates :competition_des, presence: { message: "Competition description is required" }







end
