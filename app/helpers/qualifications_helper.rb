module QualificationsHelper

def calc_score(participant, round)
	total_score = 0
	Score.where("participant_id" => participant.id, "round_id" => round).each do |s|
		if s.marks != nil
			total_score += s.marks
		end
	end
	return total_score
end


end
