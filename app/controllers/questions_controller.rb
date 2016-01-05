class QuestionsController < ApplicationController
	before_filter :check_authentication

	def question_params
		params.require(:question).permit(:question_details, :marks, :category)
	end

	def check_authentication
		if session[:user_type] == nil
			flash[:notice] = 'Select one of the methods'
			redirect_to root_path
		end

	end

	def index
		@competition = Competition.find params[:competition_id]
		@round = Round.find params[:round_id]
		@questions = Question.where("round_id" => params[:round_id])

				
	end
	
	def new
		@round = Round.find params[:round_id]
		@question=Question.new
 			
	end

	def create
		q_params = question_params	
		q_params[:round_id] = params[:round_id]
		@question = Question.new(q_params)
		if @question.save
			flash[:notice] = "Question added successfully"
			redirect_to competition_round_questions_path
		else 
			render 'new'
		end
	
	
	end
	
	def show
		@competition = params[:competition_id]
		@round = params[:round_id]
		@question = Question.find params[:id]
	end
	def edit
		@competition = Competition.find params[:competition_id]
		@round = Round.find params[:round_id]
		#@round = params[:round_id]
		@question = Question.find params[:id]
	end

	def update
		@question = Question.find params[:id]
		q_params = question_params	
		q_params[:round_id] = params[:round_id]
		if @question.update_attributes(q_params)	
			redirect_to competition_round_questions_path(params[:competition_id], params[:round_id])
		else
			render 'edit'
			#redirect_to edit_competition_round_question_path(params[:competition_id], params[:round_id], params[:id])
		end
	end

	def destroy
		@question = Question.where("id" => params[:id]).first
		@question.destroy
		flash[:notice] = "Question with category  '#{@question.category}' successfuly deleted'"
		redirect_to competition_round_questions_path
	end
end
