class Round < ActiveRecord::Base
	belongs_to :competition
	#belongs_to :participants
	has_and_belongs_to_many :participants
end
