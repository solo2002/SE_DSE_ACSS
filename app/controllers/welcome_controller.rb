class WelcomeController < ApplicationController
  	skip_before_filter :verify_authenticity_token  
    def index
    	session[:user_type] = nil
    	session[:user_id] = nil
    end
    def create
      if params[:user]!= nil
        redirect_to root_path
      else
            #	#autenticate for admin
          cred= params[:cred]
          puts params[:cred]
          user = User.where(:email_id => params[:cred][:email_id].downcase).first
          puts "user"
          puts params[:cred][:password]
          user.encrypt(user)
          #if user && User.valid(user,params[:cred][:password])
          if user && user.authenticate(params[:cred][:password])
              if(user.is_admin==1)
                session[:user_type] = 'admin'
                puts "admin"
              else
                session[:user_type] = 'judge'
                #session[:user_id] = params[:cred][:email_id]
                jinfo = Judge.where("j_email" => cred[:email_id])
                if jinfo != nil 
                  jinfo.each do |info|
                    if info.password == cred[:password]
                      session[:user_id] = info.id
                    end
                  end
                end
                puts "judge"
              end
              redirect_to competitions_path
          else
              flash[:notice] = "Invalid email/password combination"
              session[:user_type] = nil
              redirect_to root_path
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
