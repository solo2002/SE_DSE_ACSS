module QualificationsHelper

def calc_score(participant)
	total_score = 0
	Score.where("participant_id" => participant.id).each do |s|
		total_score += s.marks
	
	end
	return total_score
end


end
