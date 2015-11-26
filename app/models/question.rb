class Question < ActiveRecord::Base
	#attr_accessor :question_details, :marks
	#def initialize question_details, marks
    #	@question_details = question_details
    #	@marks = marks
	#end
	has_one :score
	belongs_to :round
	validates :question_details, presence: { message: "Question details is required" },uniqueness: { case_sensitive: false, message: "Question already exists" }
	validates :marks, presence: { message: "Marks is required" }
end
