class Qualification < ActiveRecord::Base
	belongs_to :particpant
	belongs_to :round
	validates :participant_number, presence: true
end
