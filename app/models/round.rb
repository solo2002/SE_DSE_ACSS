class Round < ActiveRecord::Base
	belongs_to :competition
	has_many :qualifications
	has_many :participants, through: :qualifications
	validates :round_name, presence: { message: "Round name is required" }
end
