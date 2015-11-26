class Round < ActiveRecord::Base
	belongs_to :competition
	has_many :qualifications
	has_many :participants, through: :qualifications
	validates :round_name, presence: { message: "Round name is required" },uniqueness: { case_sensitive: false, message: "Round name already exists" }
end
