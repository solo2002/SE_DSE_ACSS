class JudgesController < ApplicationController
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

	end
	def judge_params
        params.require(:judge).permit(:j_name, :j_loc, :j_phone, :j_email, :j_des)
end
end
