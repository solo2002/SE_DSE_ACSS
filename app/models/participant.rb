class Participant < ActiveRecord::Base
	has_and_belongs_to_many :competitions
	has_and_belongs_to_many :rounds
	has_many :scores
end
