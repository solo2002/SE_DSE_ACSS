# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

competitions = [{:competition_name => 'Rookie', :competition_des => 'For rookie', :no_of_rounds => 3},
				{:competition_name => 'Ringman', :competition_des => 'For ringman', :no_of_rounds => 3},
				{:competition_name => 'Senior', :competition_des => 'For senior', :no_of_rounds => 3},
				{:competition_name => 'Champion', :competition_des => 'For champion', :no_of_rounds => 3}]
				

rounds = [{:round_name => 'First', :round_des => 'First round', :no_of_participants => 30},
    	  {:round_name => 'Interview', :round_des => 'Second round', :no_of_participants => 20},
    	  {:round_name => 'Final', :round_des => 'Third Round', :no_of_participants => 10}]

participants = [{:p_name => 'Anavil', :p_loc => 'India', :p_phone => 2009121230, :p_email => 'anavilSuperman01@tamu.edu'}, {:p_name => 'Kiran', :p_loc => 'India', :p_phone => 2102495670, :p_email => 'kiranBatman01@tamu.edu'}]

judges = [{:j_name => 'Judge Abhi', :j_loc => 'Texas', :j_phone => 9329101230, :j_email => 'judge@judge.com', :j_des => 'super judge for seed', :password => 'judgepass'}]
users = [{:email_id => "admin@admin.com", :password_digest => "adminpass", :is_admin => 1},{:email_id => "judge@judge.com", :password_digest => "judgepass", :is_admin => 0}]


competitions.each do |competition|
	Competition.create!(competition)

end
#competitions.each do |competition|
 #       Competition.create!(competition)
  #      rounds.each do|round,competition|                
   #                     Round.create!(round)
    #    end
#end

#rounds.each do |round|
#	Round.create!(round)
#end

participants.each do |participant|
	Participant.create!(participant)
end

users.each do |user|
	User.create!(user)
end

judges.each do |judge|
	Judge.create!(judge)
end
