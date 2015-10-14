class RoundsController < ApplicationController
def index
	@rounds = Round.all
end
def new
end

def show 
	@round = Round.find(params[:id])
end
def create
	#render json: params[:round].inspect
	@round = Round.new(round_params)
	@round.save
	redirect_to @round
end

	private
	def round_params
	params.require(:round).permit(:round_name, :round_des, :no_of_participants)
	end

def edit
	@round = Round.find(params[:id])
end

def update
	@round = Round.find params[:id]
	@round.upddate_attributes!(round_params)
	flash[:notice] = "#{@round.round_name} successfully updated."
	redirect_to @round
end

def destroy
	@round = Round.find params[:id]
	@round.destroy
	flash[:notice] = "Round '#{@round.title}' successfuly deleted'"
	redirect_to rounds
end
end
