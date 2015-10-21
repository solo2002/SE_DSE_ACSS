class QualificationsController < ApplicationController

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
end


end
