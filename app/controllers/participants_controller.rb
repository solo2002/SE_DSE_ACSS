class ParticipantsController < ApplicationController

before_filter :load_round
def index
	@participants = @round.participants.all
end
def new
	@participant = @round.participants.new
end
def create
	@participant = @round.participants.new(participant_params)
	respond_to do |format|
	if @participant.save
		format.html { redirect_to [@round,@participant], notice: 'Participant was successfully created.' }
	else
		format.html { render :new }
	end
	end
end
def show
	@participant = @round.participants.find(params[:id])
end

private

def participant_params
		params.require(:participant).permit(:p_name, :p_loc, :p_phone, :p_email, :p_des)
end

def load_round
	@round= Round.find(params[:round_id])
	#render json: @round
end

end
