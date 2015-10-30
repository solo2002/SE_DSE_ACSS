class JudgesController < ApplicationController
	before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the methods'
		redirect_to root_path
	end

end
	def index
		@judges = Judge.all
	end

	def new

	end

	def create
		@judge = Judge.new(judge_params)
        	@judge.save
        	redirect_to judge_path(@judge)
	end

	def show
        	@judge = Judge.find(params[:id])
        	@selected_competition_ids = Array.new
          competition_judges = CompetitionsJudge.where("judge_id" => params[:id])
          competition_judges.each do |competition_judge|
            @selected_competition_ids[competition_judge.competition_id]=true
          end

	end

	def judge_params

        params.require(:judge).permit(:j_name, :j_loc, :j_phone, :j_email, :j_des, :password)
	end

  def edit
    @judge = Judge.find(params[:id])
  end

  def update
  	@judge = Judge.find params[:id]
  	@judge.update_attributes!(params[:judge].permit(:j_name, :j_loc, :j_phone, :j_email, :j_des))
  	flash[:notice] = "#{@judge.j_name} successfully updated."
  	redirect_to judge_path(@judge)
  end

end
