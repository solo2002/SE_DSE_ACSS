class QuestionsController < ApplicationController
	before_filter :check_authentication

	def question_params
		params.require(:question).permit(:question_details, :marks)
	end

	def check_authentication
		if session[:user_type] == nil
			flash[:notice] = 'Select one of the methods'
			redirect_to root_path
		end

	end

	def index
		@round = Round.find params[:round_id]
		@questions = Question.where("round_id" => params[:round_id])

				
	end
	
	def new
		@round = Round.find params[:round_id]
 			
	end

	def create
		q_params = question_params	
		q_params[:round_id] = params[:round_id]
		@question = Question.new(q_params)
		@question.save
		flash[:notice] = "Question added successfully"
		redirect_to competition_round_questions_path
	
	
	end
	
	def show

		@competition = params[:competition_id]
		@round = params[:round_id]
		@question = Question.find params[:id]
	end
	def edit
		@competition = params[:competition_id]
		@round = Round.find params[:round_id]
		@questions = params[:id]
	end

	def update
	end

	def destroy
	end
end
