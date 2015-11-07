class ScoresController < ApplicationController
	def index
	end
	def new
		#@questions_scores=Array.new
		@questions = Question.where("round_id" => params[:round_id]).order(id: :asc)
	end
	def create
		qualification = Qualification.where("id"=params[:qualification_id])[0]
		p_id=qualification.participant_id
		r_id=qualification.round_id
		j_id = session[:user_id]
		scores_parti = params[:scores]
		i=0
		@questions.each do |question|
			@score_parti[i]
			@score=Score.new(p_id,j_id,r_id,question.id)
			@score.save
			i++
			#insert question.id,
			#@score_parti[0]
			#scores_question[question.id]=
		end

		end
		q_params = question_params	
		q_params[:round_id] = params[:round_id]
		@question = Question.new(q_params)
		@question.save
		flash[:notice] = "Question added successfully"
		redirect_to competition_round_questions_path
	
		render json: params[:scores].inspect
	end
end
