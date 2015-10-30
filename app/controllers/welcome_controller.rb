class WelcomeController < ApplicationController
	skip_before_filter :verify_authenticity_token  
  def index
  	session[:user_type] = nil
  	session[:user_id] = nil
  end
	def create
		if params[:user]== nil
			redirect_to root_path
		else
		
		if params[:user][:admin] != nil
			session[:user_type] = params[:user][:admin] 
		

		
		elsif params[:user][:judge] != nil
			session[:user_type] = params[:user][:judge] 
		end
		
			
		
		if session[:user_type] == nil
			redirect_to root_path
		elsif session[:user_type] == 'user'
			cred=params[:cred]
			#render plain: cred[:password].inspect
			pinfo = Participant.where("p_email" => cred[:email_id])
			if pinfo != nil 
				pinfo.each do |info|
					if info.password == cred[:password]
						#render json: pinfo
						#user autenticated -> set session for current user
						session[:user_id] = info.id 
						params[:id] = info.id
						redirect_to participant_path(params[:id])
					else
						session[:user_id] = 'not real'
						session[:user_type] = nil
						redirect_to root_path
					end

				end
			else
				session[:user_id] = 'not real'
				session[:user_type] = nil
				redirect_to root_path
			end
		elsif session[:user_type] == 'judge'
			#autenticate for judge
			cred = params[:cred]
			jinfo = Judge.where("j_email" => cred[:email_id])
			if jinfo != nil 
				jinfo.each do |info|
					if info.password == cred[:password]
						#render json: jinfo
						#Judge autenticated -> set session for current user
						session[:user_id] = info.id 
						params[:id] = info.id
						redirect_to competitions_path(params[:id])
					else
						session[:user_id] = 'not real'
						session[:user_type] = nil
						redirect_to root_path
					end

				end
			else
				session[:user_id] = 'not real'
				session[:user_type] = nil
				redirect_to root_path
			end
		else
#			#autenticate for admin
			puts "Agdam choo bagdam choo"
			puts params[:user[0]]
			cred= params[:cred]
			#render plain: params[:user].inspect
			if cred[:email_id] == 'admin' && cred[:password] == 'admin'

				puts params[:user[0]]
				redirect_to competitions_path
			else
				session[:user_type] = nil
				redirect_to root_path
			end
		end
	
	end
	end
	def new
	end
	
	def destroy
		session.delete(:user_type)
		redirect_to root_path
	end
end

