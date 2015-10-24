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
	cj_params=Hash.new
	cj_params[:judge_id]=params[:judge_id]
	old_cj = CompetitionsJudge.where("judge_id" => cj_params[:judge_id])
  old_cj.delete_all
  puts params[:arr_comp]
  if params[:arr_comp] != nil
    params[:arr_comp].each do |selected_competition_id|
      cj_params[:competition_id] = selected_competition_id
      @cj = CompetitionsJudge.new(cj_params)
      @cj.save
    end
  end
  	judge = Judge.find cj_params[:judge_id]
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

