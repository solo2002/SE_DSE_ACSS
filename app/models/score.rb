class Score < ActiveRecord::Base
	belongs_to :participant
	belongs_to :round
	belongs_to :judge
	#has_and_belongs_to_many :participants

end
