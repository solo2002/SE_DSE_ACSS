class Comment < ActiveRecord::Base
	belongs_to :participant
	belongs_to :round
	belongs_to :judge
end
