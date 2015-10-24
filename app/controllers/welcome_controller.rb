class WelcomeController < ApplicationController
  def index
  end
	def create
		session[:user_id] = params[:user] 
#		render plain: params[:user].inspect
		redirect_to competitions_path
	
	end
	def new
	end
end
