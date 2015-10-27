class Question < ActiveRecord::Base
	has_one :score
	belongs_to :round
	
end
