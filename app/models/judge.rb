class Judge < ActiveRecord::Base
	has_and_belongs_to_many :competitions
        has_many :scores

end
