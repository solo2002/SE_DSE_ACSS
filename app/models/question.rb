class Question < ActiveRecord::Base
	attr_accessor :question_details, :marks
	def initialize question_details, marks
    	@question_details = question_details
    	@marks = marks
	end
	has_one :score
	belongs_to :round
	
end
