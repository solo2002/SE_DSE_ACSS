
# Add a declarative step here for populating the DB with competitions.
Given /^the following competitions exist:$/ do |competitions_table|
competitions_table.hashes.each do |competition|
Competition.create!(competition)
# each returned element will be a hash whose key is the table header.
# you should arrange to add that movie to the database here.
end
end


Given /I am logged in as Admin/ do
	visit path_to("Welcome page")
	fill_in("Email", :with => "admin")
	fill_in("Password", :with => "admin")
	check("Admin")
	uncheck("Judge")
	click_button("Submit")
end

Then /I should see Details about Competition "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Details about Participant "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Details about Round "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Competition Name "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Competition Desc "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see No of Rounds "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Name "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Location "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Phone "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Email "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Description "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Round Name "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Round Des "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see No of participants "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

