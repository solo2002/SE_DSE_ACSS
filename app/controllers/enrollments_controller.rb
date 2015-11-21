class EnrollmentsController < ApplicationController
	before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the methods'
		redirect_to root_path
	end

end
def enrollment_params
	params.permit(:competition_id, :participant_id)
	#params.require(:
end

def index
  @competition = Competition.find params[:competition_id]
  enrollments = Enrollment.where("competition_id" => params[:competition_id])
  participant_ids = Array.new
	enrollments.each do |enrollment|
		participant_ids.push(enrollment.participant_id)
	end

  @participants = Participant.where("id" => participant_ids)
  @location_names = @participants.uniq.pluck(:p_loc)
  @participant_count=@participants.count
  
	#if(params[:filter_by_location] != nil)
		#@participants=Participant.where("p_loc"=> params[:filter_by_location])
	#end

	if(params[:sort].to_s == 'P_Name')
		@participants = @participants.sort_by{|p| p.p_name }
	elsif(params[:sort].to_s == 'p_loc')
		@participants = @participants.sort_by{|p| p.p_loc }
	end
end

def new
	@participant = Participant.find params[:participant_id]
  enrollments = Enrollment.where("participant_id" => params[:participant_id])
  @selected_competition_ids= Hash.new
  @rounds = Hash.new
  @questions = Hash.new
  @scores = Hash.new
  @totalScores = Hash.new
  @roundScore = Hash.new
  @roundTotalScore = Hash.new
  @percentRoundScore = Hash.new
  competition_ids = Array.new
  i=0
  enrollments.each do |enrollment|
    @selected_competition_ids[enrollment.competition_id]=true
    competition_ids[i] = enrollment.competition_id
    @rounds[enrollment.competition_id] = Round.where "competition_id" => enrollment.competition_id
    @rounds[enrollment.competition_id].each do |round|
      @roundTotalScore[round.id] = 0
      @roundScore[round.id] = 0
      @percentRoundScore[round.id] = 0.0
      @questions[round.id] = Question.where "round_id" => round.id
      @questions[round.id].each do |question|
        curScores = Score.where "question_id = ? AND participant_id = ? AND round_id = ?", question.id, params[:participant_id], round.id
        @scores[question.id] = 0
        @totalScores[question.id] = 0
        curScores.each do |score|
          @roundScore[round.id] = @roundScore[round.id] + score.marks
          @roundTotalScore[round.id] = @roundTotalScore[round.id] + question.marks
          @scores[question.id] = @scores[question.id] + score.marks
          @totalScores[question.id] = @totalScores[question.id] + question.marks 
        end  
      end
      if @roundTotalScore[round.id] != 0
        @percentRoundScore[round.id] = (@roundScore[round.id].to_f/@roundTotalScore[round.id]) * 100;  
      end
    end
    i=i+1
  end
  @competitions=Competition.where "id" => competition_ids
 
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
	redirect_to participants_path(@competition)
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
	
