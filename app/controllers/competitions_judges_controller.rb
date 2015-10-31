class CompetitionsJudgesController < ApplicationController
	before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the methods'
		redirect_to root_path
	end

end

	


	def competitions_judges_params
	params.permit(:competition_id, :judge_id)
	end


def index
  @competition = Competition.find params[:competition_id]
	comp_judges = CompetitionsJudge.where("competition_id" => params[:competition_id])
	judge_ids = Array.new
	comp_judges.each do |comp_judge|
		judge_ids.push(comp_judge.judge_id)
	end

	@judges = Judge.where("id" => judge_ids)
	
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
      puts "inside"
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

private :competitions_judges_params
end

