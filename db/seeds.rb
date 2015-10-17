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
				

rounds = [{:round_name => 'Interview', :round_des => 'For interviewing', :no_of_participants => 3},
    	  {:round_name => 'Dance', :round_des => 'For dancing', :no_of_participants => 3},
    	  {:round_name => 'Semis', :round_des => 'semifinals', :no_of_participants => 3},
          {:round_name => 'Finals', :round_des => 'finals', :no_of_participants => 3}]

competitions.each do |competition|
	Competition.create!(competition)
end

rounds.each do |round|
	Round.create!(round)
end
