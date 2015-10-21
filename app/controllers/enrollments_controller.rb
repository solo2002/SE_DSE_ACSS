class EnrollmentsController < ApplicationController
def enrollment_params
	#params.require(:enrollment).permit(:competition_name, :competition_des, :no_of_rounds)
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
end

def show 
	@enrollment = Enrollment.find(params[:id])
end

def create
	#render json: params[:round].inspect
	@enrollment = Enrollment.new(enrollment_params)
	@enrollment = Enrollment.new(competition_params)
	@enrollment.save
	flash[:notice] = "Participants successfully added to competition"
	redirect_to enrollment_path(@competition)
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
	#@enrollment = competition
	@enrollment.destroy
	flash[:notice] = "Enrollment '#{@round.title}' successfuly deleted'"
	redirect_to enrollments
end

private :enrollment_params

end
	
