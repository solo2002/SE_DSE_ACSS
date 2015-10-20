class Qualification < ActiveRecord::Base
	belongs_to :particpant
	belongs_to :round
end
