class QualificationsController < ApplicationController
before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the methods'
		redirect_to root_path
	end

end
def qualifications_params
	params.require(:qualifications).permit(:round_id, :participant_id)
end

def index
	qualifications = Qualification.where("round_id" => params[:round_id])
	participant_ids = Array.new
	qualifications.each do |qualification|
		participant_ids.push qualification.participant_id
	end
	@participants = Participant.where("id" => participant_ids)
	@competition = params[:competition_id]
	@round = params[:round_id]
end


def new
	@round = Round.find params[:round_id]
	@qualifications = Qualification.where("round_id" => params[:round_id])
	participant_ids = Array.new
	@qualifications.each do |qual|
		participant_ids.push(qual.participant_id)
	end
	@participants = Participant.where("id" => participant_ids)
	@rounds = Round.where "competition_id" => params[:competition_id]
end

def create
	#render json: params[:arr_round].inspect
	#render json: params[:arr_part].inspect

	if params[:arr_round] != nil && params[:round_id] !=nil
	qual_params = Hash.new
	params[:arr_round].each do |ind_round_id|
		qual_params[:round_id] = ind_round_id

		params[:arr_part].each do |individual_part_id|
			qual_params[:participant_id] = individual_part_id
			@qualification = Qualification.new(qual_params)
			@qualification.save
		end

	end


	flash[:notice] = "Participants successfully added to rounds"

	redirect_to competitions_path
	#@competition = Round.find params[:competition_id]
	#redirect_to competition_path(@competition)
	#if @competition == nil
#		redirect_to competitions_path
	#else
	#	redirect_to competition_rounds_path(@competition,@round)
	#end
	

	# untouched portion -> need to resolve id conflicts
	#qual_params = Hash.new
	#qual_params[:round_id] = params[:r_id]
	#params[:participant_id].each do |individual_part_id|
	#	qual_params[:participant_id] = individual_part_id
	#	@qualification = Qualification.new(qual_params)
	#	@qualification.save
	#end
	#flash[:notice] = "Participants successfully added to rounds"
	#@competition = params[:competition_id]
	#redirect_to competition_rounds_path(@competition,@round)
else
	redirect_to competitions_path
end
	
end

private :qualifications_params
end
