class EnrollmentsController < ApplicationController
def enrollment_params
	params.permit(:competition_id, :participant_id)
	#params.require(:
end

def index
	enrollments = Enrollment.where("competition_id" => params[:competition_id])
	participant_ids = Array.new
	enrollments.each do |enrollment|
		participant_ids.push(enrollment.participant_id)
	end

	@participants = Participant.where("id" => participant_ids)
end

def new
	@participant = Participant.find params[:participant_id]
  enrollments = Enrollment.where("participant_id" => params[:participant_id])
  @selected_competition_ids= Hash.new
  enrollments.each do |enrollment|
    @selected_competition_ids[enrollment.competition_id]=true
  end
 
end

def show 
	@enrollment = Enrollment.find(params[:id])
end

def create
	#render json: params[:round].inspect
  enroll_params= Hash.new
  enroll_params[:participant_id]= params[:participant_id]
  old_enrollments = Enrollment.where("participant_id" => enroll_params[:participant_id])
  old_enrollments.destroy_all
  if params[:competition_id] != nil
    params[:competition_id].each do |selected_competition_id|
      enroll_params[:competition_id] = selected_competition_id
      @enrollment = Enrollment.new(enroll_params)
      @enrollment.save
    end
  end
  participant = Participant.find enroll_params[:participant_id]
	flash[:notice] = "Participant #{participant.p_name}'s competitions were successfully changed"
	if session[:user_type] == 'user'
		redirect_to participant_path(session[:user_id])
	elsif session[:user_type] == 'new user'
		session[:user_type] = nil
		redirect_to root_path
	else
	redirect_to participants_path(@competition)
	end
end

def edit
	@enrollment = Enrollment.find(params[:id])
end

def update
	@enrollment = Enrollment.find params[:id]
	@enrollment.update_attributes!(params[:competition].permit(:competition_name, :competition_des, :no_of_rounds))
	flash[:notice] = "#{@enrollment.competition_name} successfully updated."
	redirect_to enrollment_path(@competition)
end

def destroy
	@enrollment = Enrollment.find params[:id]
	#@enrollment = @competition
	@enrollment.destroy
	flash[:notice] = "Enrollment '#{@round.title}' successfuly deleted'"
	redirect_to enrollments
end

private :enrollment_params

end
	
