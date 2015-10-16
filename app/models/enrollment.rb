class Enrollment < ActiveRecord::Base
	belongs_to :competitions
	belongs_to :participants
end
