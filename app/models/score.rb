class Score < ActiveRecord::Base
	belongs_to :participants
	belongs_to :rounds
	belongs_to :judges
	#has_and_belongs_to_many :participants

end
