class CommentsController < ApplicationController


	def new

	end

	def create
		qualification = (Qualification.where "id" => params[:qualification_id])[0]
		p_id=qualification.participant_id
		r_id=qualification.round_id
		j_id = session[:user_id]
		comment_params = Hash["participant_id" , p_id, "round_id", r_id, "judge_id" ,j_id]

		comment_params[:comment_des] = params[:comment][:comment_des]
		comment = Comment.new(comment_params)
		comment.save
		
		competition = params[:competition_id]
		round = params[:round_id]
		
		redirect_to competition_round_qualifications_path(competition, round)

	end
	
	def update

	end



end
