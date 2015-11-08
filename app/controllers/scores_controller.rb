class ScoresController < ApplicationController
	def index
	end
	def new
		#@questions_scores=Array.new
		@questions = Question.where("round_id" => params[:round_id]).order(id: :asc)
	end

	def create
		qualification = (Qualification.where "id" => params[:qualification_id])[0]
		p_id=qualification.participant_id
		r_id=qualification.round_id
		j_id = session[:user_id]
		puts params[:scores]
		puts scores_parti
		i=0
		score_params = Hash["participant_id" , p_id, "round_id", r_id, "judge_id" ,j_id]
		@questions.each do |question|
			score_params[:question_id] = question.id
			score_params[:marks] =  scores_parti[i]
			score=Score.new(score_params)
			score.save
			i+=1
		end
		
		competition = params[:competition_id]
		round = params[:round_id]
		
		redirect_to new_competition_round_qualification_comment_path(competition, round, qualification)
#
#		q_params = question_params	
#		#q_params[:round_id] = params[:round_id]
#		@question = Question.new(q_params)
#		@question.save
#		flash[:notice] = "Question added successfully"
#		redirect_to competition_round_questions_path
	
#		render json: params[:scores].inspect
	end
	
	def update

	end

end

