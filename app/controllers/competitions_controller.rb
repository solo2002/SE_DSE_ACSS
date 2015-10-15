class CompetitionsController < ApplicationController
def competition_params
	params.require(:competition).permit(:competition_name, :competition_des, :no_of_rounds)
end

def index
	@competitions = Competition.all
end

def new
end

def show 
	@competition = Competition.find(params[:id])
end

def create
	#render json: params[:round].inspect
	@competition = Competition.new(competition_params)
	@competition.save
	redirect_to competition_path(@competition)
end

def edit
	@competition = Competition.find(params[:id])
end

def update
	@competition = Competition.find params[:id]
	@competition.update_attributes!(params[:competition].permit(:competition_name, :competition_des, :no_of_rounds))
	flash[:notice] = "#{@competition.competition_name} successfully updated."
	redirect_to competition_path(@competition)
end

def destroy
	@competition = Competition.find params[:id]
	#@competition = competition
	@competition.destroy
	flash[:notice] = "Competition '#{@round.title}' successfuly deleted'"
	redirect_to competitions
end

private :competition_params

end

