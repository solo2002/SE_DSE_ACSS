class Question < ActiveRecord::Base
	has_one :score
	belongs_to :participant
	belongs_to :round
	belongs_to :competition
end
