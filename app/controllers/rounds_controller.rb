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
end
def create
	#render json: params[:round].inspect
	@competition = Competition.find params[:competition_id]
	@round = @competition.rounds.new(round_params)
	@round.save
	redirect_to competition_round_path(@competition, @round)
end

	private
	def round_params
	params.require(:round).permit(:round_name, :round_des, :no_of_participants)
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
	redirect_to @round
end

def destroy
	@competition = Competition.find params[:competition_id]
	@round = @competition.rounds.find params[:id]
	@round.destroy
	flash[:notice] = "Round '#{@round.title}' successfuly deleted'"
	redirect_to rounds
end


end
