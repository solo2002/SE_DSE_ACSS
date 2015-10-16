class Question < ActiveRecord::Base
	has_one :score
	belongs_to :participants
	belongs_to :rounds
	belongs_to :competitions
end
