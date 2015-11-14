class RoundsController < ApplicationController
	before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the methods'
		redirect_to root_path
	end

end
def index
	
	@competition = Competition.find params[:competition_id]
	@rounds = @competition.rounds.all
  
	
end
def new
end

def show 
	@competition = Competition.find params[:competition_id]
	@round = @competition.rounds.find(params[:id])
	
	#Leaderboard display part
	qualifications = Qualification.where("round_id" => params[:id])
	participant_ids = Array.new
	qualifications.each do |qualification|
		participant_ids.push qualification.participant_id
		end
	@participants = Participant.where("id" => participant_ids)

end
def create
	#render json: params[:round].inspect
	@competition = Competition.find params[:competition_id]
	@round = @competition.rounds.new(round_params)
	@round.save
	redirect_to competition_round_path(@competition, @round)
end



def edit
	@competition = Competition.find params[:competition_id]
	@round = @competition.rounds.find(params[:id])  

end

def update
	@competition = Competition.find params[:competition_id]
	@round = @competition.rounds.find params[:id]
	@round.update_attributes!(round_params)
	flash[:notice] = "#{@round.round_name} successfully updated."
  redirect_to competition_round_path(@competition, @round)
end

def destroy
  puts "destroy round"
	@round = Round.where("id" => params[:id]).first
	@round.destroy
	flash[:notice] = "Round '#{@round.round_name}' successfuly deleted'"
	redirect_to competition_rounds_path
end

#def save_part_score
#	@qualifications=Qualification.where("round_id"=>params[:round_id],"participant_id"=>params[:participant_id])
#	@qualifications.each do |q|
#		@qualification_id=q.id
#	end
#	@questions=Question.where("round_id" => params[:round_id])
#end
private
	def round_params
    params.require(:round).permit(:round_name, :round_des, :no_of_participants)
	end

end
