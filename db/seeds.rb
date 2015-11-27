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
				

champion_rounds = [{:round_name => 'Prelims', :round_des => 'First round', :no_of_participants => 30},
    	  {:round_name => 'Semifinals', :round_des => 'Second round', :no_of_participants => 20},
    	  {:round_name => 'Finals', :round_des => 'Third Round', :no_of_participants => 10}]

ringman_rounds = [{:round_name => 'Prelims', :round_des => 'First round', :no_of_participants => 30},
    	  {:round_name => 'Finals', :round_des => 'Third Round', :no_of_participants => 10}]


participants = [{:p_name => 'Anavil', :p_loc => 'India', :p_phone => 1234567890, :p_email => 'anavilSuperman@tamu.edu'}, 
		{:p_name => 'Abhishek', :p_loc => 'India', :p_phone => 1234567891, :p_email => 'abhishekDoga@tamu.edu'},
		{:p_name => 'Anamika', :p_loc => 'India', :p_phone => 1234567892, :p_email => 'anavilSuperwoman@tamu.edu'},
		{:p_name => 'Ji', :p_loc => 'India', :p_phone => 1234567893, :p_email => 'jiSpiderman@tamu.edu'},
		{:p_name => 'Mallika', :p_loc => 'India', :p_phone => 1234567894, :p_email => 'anavilCatwoman@tamu.edu'},
		{:p_name => 'Kiran', :p_loc => 'India', :p_phone => 1234567895, :p_email => 'kiranBatman@tamu.edu'}]

judges = [{:j_name => 'Judge Abhi', :j_loc => 'Texas', :j_phone => 1234567890, :j_email => 'judge@judge.com', :j_des => 'super judge for seed', :password => 'judgepass'},
	{:j_name => 'Lance', :j_loc => 'Texas', :j_phone => 1234567891, :j_email => 'lance@lance.com', :j_des => 'super judge for seed', :password => 'judgepass'},
	{:j_name => 'Huang', :j_loc => 'Texas', :j_phone => 1234567892, :j_email => 'huang@huang.com', :j_des => 'super judge for seed', :password => 'judgepass'},
	{:j_name => 'Choe', :j_loc => 'Texas', :j_phone => 1234567893, :j_email => 'choe@choe.com', :j_des => 'super judge for seed', :password => 'judgepass'}]
	{:j_name => 'Dumbledore', :j_loc => 'Hogwarts', :j_phone => 9876543210 , :j_email => 'harry@ron.com', :j_des => 'Hogwarts headmaster', :password => 'abracadabra'}

users = [{:email_id => "admin@admin.com", :password_digest => "adminpass", :is_admin => 1}]


competitions.each do |competition|
        c = Competition.new(competition)
	c.save
        if c.competition_name == 'Champion'
		champion_rounds.each do|round|                
                        c.rounds.create!(round)
 	       end
	elsif c.competition_name == 'Ringman'
		ringman_rounds.each do |round|
			c.rounds.create!(round)
		end
	elsif c.competition_name == 'Senior' or c.competition_name == 'Rookie'
		
		c.rounds.create!({:round_name => "#{c.competition_name} Round", :round_des => 'First round', :no_of_participants => 30})
	
	else 
		puts "GODDAMN!! Wrong competition name"

	end
end


participants.each do |participant|
	p = Participant.new(participant)
	p.save
	Competition.all.each do |c|
			Enrollment.create!({"participant_id" => p.id, "competition_id" => c.id})	
		p_number = 1
		c.rounds.each do |r|
			if r.round_name == "Prelims"
				Qualification.create!({:participant_id => p.id, :round_id => r.id, :participant_number => p_number })
			end
		end			
	end
end

users.each do |user|
	User.create!(user)
	judges.each do |judge|
		j = Judge.new(judge)
		j.save
		User.create!({"email_id" => j.j_email, "password_digest" => judge[:password], :is_admin => 0})
	end
	
end

