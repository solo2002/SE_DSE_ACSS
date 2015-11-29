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
		@judges = Judge.all.limit(params[:display_items])
		@location_names = Judge.uniq.pluck(:j_loc)
		@judge_count=Judge.count
		if(params[:filter_by_location] != nil)
			@judges=Judge.where("j_loc"=> params[:filter_by_location])
		end
		if(params[:sort].to_s == 'j_name')
			@judges = @judges.sort_by{|p| p.j_name }
		elsif(params[:sort].to_s == 'j_loc')
			@judges = @judges.sort_by{|p| p.j_loc }
		end
	end

	def new
		@judge = Judge.new
	end

	def create
		@judge = Judge.new(judge_params)
		if @judge.save
			user = User.new
			user.email_id = judge_params["j_email"]
			user.password_digest = judge_params["password"]
			user.is_admin = 0
			user.save
			flash[:notice] = "#{@judge.j_name} successfully created"
			redirect_to judge_path(@judge)
		else
			render 'new'
		end
	end

	def show
		@judge = Judge.find(params[:id])
		@selected_competition_ids = Array.new
		competition_judges = CompetitionsJudge.where "judge_id" => params[:id]
		competition_judges.each do |competition_judge|
			if competition_judge.competition_id
				@selected_competition_ids[competition_judge.competition_id]=true
			end
		end

	end

	def judge_params

        params.require(:judge).permit(:j_name, :j_loc, :j_phone, :j_email, :j_des, :password)
	end

	def edit
		@judge = Judge.find(params[:id])
    session[:return_to] ||= request.referer

	end

	def update
		@judge = Judge.find params[:id]
		old_email = @judge.j_email
		puts old_email
		if @judge.update_attributes(params[:judge].permit(:j_name, :j_loc, :j_phone, :j_email, :j_des, :password))
			user = User.where("email_id" => old_email).first
			user.update_attributes!({:email_id => params[:judge][:j_email], :password => params[:judge][:password], :is_admin => 0})
			flash[:notice] = "#{@judge.j_name} successfully updated."
			redirect_to judge_path(@judge)
			
		else
			render 'edit'
		end
    redirect_to session.delete(:return_to)
	end
	def destroy
		judge = Judge.find params[:id]
		judge.destroy
		flash[:notice] = "#{judge.j_name} successfully deleted"
		redirect_to judges_path
	end
end
