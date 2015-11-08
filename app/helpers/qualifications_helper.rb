module QualificationsHelper

def calc_score(participant, round)
	total_score = 0
	Score.where("participant_id" => participant.id, "round_id" => round).each do |s|
		total_score += s.marks
	
	end
	return total_score
end


end
