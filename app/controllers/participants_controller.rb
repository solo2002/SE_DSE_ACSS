class ParticipantsController < ApplicationController
	before_filter :check_authentication

def check_authentication
	if session[:user_type] == nil
		flash[:notice] = 'Select one of the methods'
		redirect_to root_path
	end

end
def participant_params
	params.require(:participant).permit(:p_name, :p_loc, :p_phone, :p_email, :p_des, :password)
end

def index
	@participant_count=Participant.count
	@participants = Participant.all.limit(params[:display_items])
	@location_names = Participant.uniq.pluck(:p_loc)

	if(params[:filter_by_location] != nil)
		@participants=Participant.where("p_loc"=> params[:filter_by_location])
	end
	if(params[:sort].to_s == 'P_Name')
			 @participants = @participants.sort_by{|p| p.p_name }
	elsif(params[:sort].to_s == 'p_loc')
		 @participants = @participants.sort_by{|p| p.p_loc }
	end
	#@location_names= Set.new
	#@participants.each do |p|
	#	@location_names.add(p.p_loc)
	#end
end

def new
	#@participant = @participant.participants.new
end

def create
	@participant = Participant.new(participant_params)
	@participant.save
	redirect_to new_participant_enrollment_path(@participant)
end

def show
	@participant = Participant.find(params[:id])
	@competition_enrolled = Enrollment.where("participant_id" => params[:id])
end

def edit
	@participant = Participant.find(params[:id])
end

def update
	@participant = Participant.find params[:id]
	@participant.update_attributes!(params[:participant].permit(:p_name, :p_loc, :p_phone, :p_email, :p_des))
	flash[:notice] = "#{@participant.p_name} successfully updated."
	redirect_to new_participant_enrollment_path(@participant)
end

def destroy
	@participant = Participant.find params[:id]
	@participant.destroy
	flash[:notice] = "Participant '#{@participant.p_name}' successfuly deleted'"
	redirect_to participants_path
end
def report
	@participant = Participant.find params[:participant_id]
  enrollments = Enrollment.where("participant_id" => params[:participant_id])
  @rounds = Hash.new
  @judges = Hash.new
  @questions = Hash.new
  @scores = Hash.new
  @roundTotalScore = Hash.new
  @roundComment = Hash.new
  @questionComments = Hash.new
  competition_ids = Array.new
  judge_ids = Array.new
  i=0
  if enrollments
    enrollments.each do |enrollment|
      competition_ids[i] = enrollment.competition_id
      i=i+1
      @rounds[enrollment.competition_id] = Round.where "competition_id" => enrollment.competition_id
      comp_judges = (CompetitionsJudge.where "competition_id" => enrollment.competition_id)
      if comp_judges
        comp_judges.each do |c_judge|
          judge_ids.push(c_judge.judge_id)
        end
      end  
      if @rounds[enrollment.competition_id]
        @rounds[enrollment.competition_id].each do |round|
          @judges[round.id] = Judge.where "id" => judge_ids
          @scores[round.id] = Hash.new
          @questionComments[round.id] = Hash.new
          @roundComment[round.id] = Hash.new
          @roundTotalScore[round.id] = Hash.new
          if @judges[round.id]
              @judges[round.id].each do |judge|
              @questions[round.id] = Question.where "round_id" => round.id
              @roundComment[round.id][judge.id]="*NO COMMENTS*"
              comment= (Comment.where "participant_id = ? AND judge_id = ? AND round_id = ?", params[:participant_id], judge.id, round.id).first
              if comment
                @roundComment[round.id][judge.id] = comment.comment_des
              end
              @roundTotalScore[round.id][judge.id] = 0
              @scores[round.id][judge.id]=Hash.new
              @questionComments[round.id][judge.id] = Hash.new
              if @questions[round.id]
                @questions[round.id].each do |question|
                  @scores[round.id][judge.id][question.id] =0
                  score = (Score.where "question_id = ? AND participant_id = ? AND round_id = ? AND judge_id=?", question.id, params[:participant_id], round.id, judge.id).first
                  if score
                    @scores[round.id][judge.id][question.id] = score.marks
                    @questionComments[round.id][judge.id][question.id] = score.question_comment
                    if @scores[round.id][judge.id][question.id]
                      @roundTotalScore[round.id][judge.id] = @roundTotalScore[round.id][judge.id] + @scores[round.id][judge.id][question.id]
                    end
                  end
                end
              end
            end 
          end 
        end
      end
    end
  end
  @competitions=Competition.where "id" => competition_ids
end


private :participant_params
end
