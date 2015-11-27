class Question < ActiveRecord::Base
	#attr_accessor :question_details, :marks
	#def initialize question_details, marks
    #	@question_details = question_details
    #	@marks = marks
	#end
	has_one :score
	belongs_to :round
	validates :question_details, presence: { message: "Question details is required" }
	validates :marks, presence: { message: "Score is required" }
	validates :category, presence: {message: "Category is required"}
end
