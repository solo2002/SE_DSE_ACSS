class CompetitionsJudgesController < ApplicationController
	before_filter :load_competitions
	

	def load_competitions

	@competition = Competition.find params[:competition_id] 
	puts @competition
	end


	def competitions_judges_params
	params.require(:competitions_judges).permit(:competition_id, :judge_id)
	end


def index
	puts "ajflajflajf"
	@competition_judges = CompetitionsJudge.where("competition_id" => params[:competition_id])
	@judge_ids = Array.new
	@competition_judges.each do |competition_judge|
		@judge_ids.push(competition_judge.judge_id)
	end
	@judges = Judge.where("id" => @judge_ids)
end

def new
end

def show 
#	@competition = Competition.find params[:competition_id]
#	@round = @competition.rounds.find(params[:id])
end
def create
	@competition = Competition.find params[:competition_id]
	@round = @competition.rounds.new(round_params)
	@round.save
	redirect_to competition_round_path(@competition, @round)
end
def edit
#	@competition = Competition.find params[:competition_id]
#	@round = @competition.rounds.find(params[:id])
end

def update
#	@competition = Competition.find params[:competition_id]
#	@round = @competition.rounds.find params[:id]
#	@round.update_attributes!(round_params)
#	flash[:notice] = "#{@round.round_name} successfully updated."
#	redirect_to @round
end

def destroy
#	@competition = Competition.find params[:competition_id]
#	@round = @competition.rounds.find params[:id]
#	@round.destroy
#	flash[:notice] = "Round '#{@round.title}' successfuly deleted'"
#	redirect_to rounds
end

private :load_competitions, :competitions_judges_params
end

