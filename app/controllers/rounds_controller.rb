class RoundsController < ApplicationController
def index
	puts "AAGAGAGADAM BAFAGADF"
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

def select
	waaai
	@participants = Participant.all
	@selected_participants = params[:participants]
	redirect_to competition_round_participants_path(@selected_participants)
end


end
