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
	if session[:user_type] == 'admin'
		qualifications = Qualification.where("round_id" => params[:round_id])
		participant_ids = Array.new
		qualifications.each do |qualification|
			participant_ids.push qualification.participant_id
			end
		@participants = Participant.where("id" => participant_ids)
	else
		all_qualifications = Qualification.where("round_id" => params[:round_id])
		participant_ids = Array.new

	 	all_qualifications.each do |qualification|
			if Score.where("participant_id" => qualification.participant_id, "round_id" => params[:round_id], "judge_id" => session[:user_id]).blank?
				participant_ids.push qualification.participant_id
			end
		end
		@qualifications = Qualification.where("participant_id" => participant_ids, "round_id" => params[:round_id])
	end
		@competition = params[:competition_id]
		@round = params[:round_id]
	        @roundRecord = (Round.where "id" => params[:round_id])[0]	
	#:qualification_id => Qualification.where("participant_id"=> participant.id,"round_id"=>params[:round_id])[0].id	
	

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
  @competition = Competition.find params[:competition_id]
	competition = Competition.where "id" => params[:competition_id]
	unique = Hash.new
	if params[:first_round] != nil
		round = Round.where "id" => params[:first_round]
		old_qualifications = Qualification.where("round_id" => params[:first_round])
		if !params[:arr_part]
			
			@round = Round.find params[:first_round]
			
      
      if(params[:add_part])
         flash[:warning] = "Select at least one participant to qualify"
        redirect_to competition_add_part_to_round_path(@competition) and return
      else
        flash[:warning] = "No participant to qualify"
			  redirect_to new_competition_round_qualification_path(params[:competition_id], params[:round_id]) and return
      end
		else

			old_qualifications.destroy_all
			qual_params = Hash.new
			qual_params[:round_id] = params[:first_round]
			i=0
      #Check if all participants who are selected have contestant number
      params[:arr_part].each do |individual_part_id|
        if(params[:participant_number][individual_part_id.to_s]=="")
          flash[:warning] = "Enter Contestant Number for each selected Participants!"
          
         if(params[:add_part])
            redirect_to competition_add_part_to_round_path(@competition) and return
         else
            redirect_to new_competition_round_qualification_path(params[:competition_id], params[:round_id]) and return
         end
           
       end
      end
      #Check if all contestant numbers added are selected
      params[:participant_number].keys.each do |individual_part_id|
        if(unique.has_key? params[:participant_number][individual_part_id])
          flash[:warning] = "Please give unique Contestant number to each participant"
          
          if(params[:add_part])
             redirect_to competition_add_part_to_round_path(@competition) and return
          else
             redirect_to new_competition_round_qualification_path(params[:competition_id], params[:round_id]) and return
          end
        end
        unique[params[:participant_number][individual_part_id]] = 1;
        if(!params[:arr_part].include? individual_part_id.to_s)
          flash[:warning] = "Select Participant for all the participants for whom contestant number is given!"
          
          if(params[:add_part])
             redirect_to competition_add_part_to_round_path(@competition) and return
          else
             redirect_to new_competition_round_qualification_path(params[:competition_id], params[:round_id]) and return
          end
       end
      end
			params[:arr_part].each do |individual_part_id|
				qual_params[:participant_number] = params[:participant_number][individual_part_id.to_s]
				qual_params[:participant_id] = individual_part_id
				@qualification = Qualification.new(qual_params)
				if @qualification.save
					i=i+1
				else
					flash[:notice] = "Participants were not sent to the round as there was some error"
          if(params[:add_part])
             redirect_to competition_add_part_to_round_path(@competition) and return
          else
             redirect_to new_competition_round_qualification_path(params[:competition_id], params[:round_id]) and return
          end
				end
			end
			flash[:notice] = "Participants successfully added to rounds"
			redirect_to competition_round_qualifications_path(competition[0],round[0])
		end
	else
		redirect_to competition_path(competition[0])
	end
 
end

private :qualifications_params
end
