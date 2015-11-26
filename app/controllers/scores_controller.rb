class ScoresController < ApplicationController
	def index
    @participant = Participant.where("id" => params[:participant_id])[0]
    @round = Round.where("id" => params[:round_id])[0]
    score_records = Score.where("question_id = ? AND participant_id = ? AND round_id = ?" , params[:question_id],params[:participant_id],params[:round_id])
    @scores = Hash.new
    @comments =  Hash.new
    @question=Question.where("id" => params[:question_id])[0]
    judge_ids = Array.new
    score_records.each do |score|
      judge_ids.push(score.judge_id)
      @scores[score.judge_id] = score.marks
      @comments[score.judge_id] = score.question_comment
    end
    @max_round_score = 0
    max_round_scores = Question.where("round_id" => params[:round_id])
    max_round_scores.each do |max_score|
      @max_round_score = @max_round_score + max_score.marks
    end
    @judges = Judge.where("id" => judge_ids)
    @total_scores = Hash.new
    @overall_comments = Hash.new
    judge_ids.each do |judge_id|
      @total_scores[judge_id] = 0
      @overall_comments[judge_id]=Comment.where("participant_id = ? AND round_id = ? AND judge_id = ?" ,params[:participant_id],params[:round_id],judge_id)[0].comment_des
      round_scores = Score.where("participant_id = ? AND round_id = ? AND judge_id = ?" ,params[:participant_id],params[:round_id],judge_id)
      round_scores.each do |round_score|
        @total_scores[judge_id]=@total_scores[judge_id]+round_score.marks
      end
    end
	end
	def new
		#@questions_scores=Array.new
		@questions = Question.where("round_id" => params[:round_id]).order(id: :asc)
	end

	def create
		@questions = Question.where("round_id" => params[:round_id]).order(id: :asc)
		qualification = (Qualification.where "id" => params[:qualification_id])[0]
		p_id=qualification.participant_id
		r_id=qualification.round_id
		j_id = session[:user_id]
		scores_parti = params[:scores]
    question_comments = params[:question_comments]
		i=0
		score_params = Hash["participant_id" , p_id, "round_id", r_id, "judge_id" ,j_id]
		@questions.each do |question|
			score_params[:question_id] = question.id
			score_params[:marks] =  scores_parti[i]
		        score_params[:question_comment] = question_comments[question.id.to_s]
			puts "here"
			puts question_comments[7.to_s]
			puts question_comments["7"]
			score=Score.new(score_params)
			if score.save
			i+=1
			else
			flash[:notice]="			Enter scores"
                  	 redirect_to new_competition_round_qualification_score_path(params[:competition_id],params[:round_id],qualification) and return
                        end
		end
		competition = params[:competition_id]
		round = params[:round_id]
		redirect_to new_competition_round_qualification_comment_path(params[:competition_id],params[:round_id], qualification) and return
		
	end
	
	def update

	end

end

