class ParticipantsController < ApplicationController
def participant_params
	params.require(:participant).permit(:p_name, :p_loc, :p_phone, :p_email, :p_des)
end

def index
	@participants = Participant.all
end

def new
	#@participant = @participant.participants.new
end

def create
	@participant = Participant.new(participant_params)
	@participant.save
	puts @participant.p_name
	redirect_to participant_path(@participant)
end

def show
	@participant = Participant.find(params[:id])
end

def edit
	@participant = Participant.find(params[:id])
end

def update
	@participant = Participant.find params[:id]
	@participant.update_attributes!(params[:participant].permit(:p_name, :p_loc, :p_phone, :p_email, :p_des))
	flash[:notice] = "#{@participant.p_name} successfully updated."
	redirect_to participant_path(@participant)
end

def destroy
	@participant = Participant.find params[:id]
	@participant.destroy
	flash[:notice] = "Participant '#{@participant.p_name}' successfuly deleted'"
	redirect_to participants
end

private :participant_params
end
