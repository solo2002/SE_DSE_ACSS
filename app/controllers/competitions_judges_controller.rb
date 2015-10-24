class CompetitionsJudgesController < ApplicationController
	before_filter :load_competitions
	

	def load_competitions

	
	end


	def competitions_judges_params
	params.permit(:competition_id, :judge_id)
	end


def index
	
	
end

def new
end

def show 

end
def create
	#render plain: params[:arr_comp].inspect
	cj=Hash.new
	cj[:judge_id]=params[:judge_id]
	old_cj = CompetitionsJudge.where("judge_id" => cj[:judge_id])
  	old_cj.destroy_all
  	if params[:arr_comp] != nil
    params[:arr_comp].each do |selected_competition_id|
      cj[:competition_id] = selected_competition_id
      @cj = CompetitionsJudge.new(competitions_judges_params)
      @cj.save
    end
  end
  	judge = Judge.find cj[:judge_id]
	flash[:notice] = "Judge #{judge.j_name}'s competitions were successfully changed"
	redirect_to judges_path

end
def edit

end

def update

end

def destroy

end

private :load_competitions, :competitions_judges_params
end

