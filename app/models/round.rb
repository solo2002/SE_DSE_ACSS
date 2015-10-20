class Round < ActiveRecord::Base
	belongs_to :competition
	#belongs_to :participants
	has_many :qualifications
	has_many :participants, through: :qualifications
end
