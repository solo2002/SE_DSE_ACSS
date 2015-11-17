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

participants = [{:p_name => 'Anavil', :p_loc => 'India', :p_phone => 9249}, {:p_name => 'Kiran', :p_loc => 'India', :p_phone => 923249}, {:p_name => 'Ji', :p_loc => 'Chia', :p_phone => 23923249}]
users = [{:email_id => "admin", :password_digest => "admin", :is_admin => true},{:email_id => "judge", :password_digest => "judge", :is_admin=>false}]

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
