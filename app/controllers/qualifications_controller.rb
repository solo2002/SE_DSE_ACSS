class QualificationsController < ApplicationController
before_filter :check_authentication
#include QualificationsHelper

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
	@roundRecord = (Round.where "id" => params[:round_id])[0]
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
  puts params[:competition_id]
  puts "up"
  competition = Competition.where "id" => params[:competition_id]
  
	if params[:first_round] != nil
    		round = Round.where "id" => params[:first_round]
	    old_qualifications = Qualification.where("round_id" => params[:first_round])
	    old_qualifications.destroy_all
 	    qual_params = Hash.new
	    qual_params[:round_id] = params[:first_round]
	    i=0
	    params[:arr_part].each do |individual_part_id|
		      qual_params[:participant_number] = params[:participant_number][params[:arr_part][i]]
		      qual_params[:participant_id] = individual_part_id
		      @qualification = Qualification.new(qual_params)
		      @qualification.save
		      i=i+1
		end
	  flash[:notice] = "Participants successfully added to rounds"
	  redirect_to competition_round_qualifications_path(competition[0],round[0])
  else
	  redirect_to competition_path(competition[0])
  end
end

private :qualifications_params
end
