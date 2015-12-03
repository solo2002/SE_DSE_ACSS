
# Add a declarative step here for populating the DB with competitions.
Given /^the following competitions exist:$/ do |competitions_table|
  competitions_table.hashes.each do |competition|
    Competition.create!(competition)
  end
end
Given /^the following participants exist:$/ do |participants_table|
  participants_table.hashes.each do |participant|
    Participant.create!(participant)
  end
end
Given /^the following enrollments exist:$/ do |enrollments_table|
  enrollments_table.hashes.each do |enrollment|
    Enrollment.create!(enrollment)
  end
end
Given /^the following rounds exist:$/ do |rounds_table|
  rounds_table.hashes.each do |round|
    Round.create!(round)
  end
end
Given /^the following qualifications exist:$/ do |qualifications_table|
  qualifications_table.hashes.each do |qualification|
    Qualification.create!(qualification)
  end
end
Given /^the following judges exist:$/ do |judges_table|
  judges_table.hashes.each do |judge|
    Judge.create!(judge)
  end
end
Given /^the following questions exist:$/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create!(question)
  end
end
Given /^the following scores exist:$/ do |scores_table|
  scores_table.hashes.each do |score|
    Score.create!(score)
  end
end
Given /^the following comments exist:$/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create!(comment)
  end
end
Given /^the following competition judges exist:$/ do |cjs_table|
  cjs_table.hashes.each do |cj|
    CompetitionsJudge.create!(cj)
  end
end

Given /I am logged in as Admin/ do
	visit path_to("Welcome page")
	fill_in("cred_email_id", :with => "admin@admin.com")
	fill_in("cred_password", :with => "adminpass")
  
	click_button("Login")
  
end

When /I (un)?check the following competitions: (.*)/ do |uncheck, comp_list|
  if (uncheck)
   comp_list.split(', ').each {|x| step %{I uncheck "arr_comp_#{x}"}}
  else
   comp_list.split(', ').each {|x| step %{I check "arr_comp_#{x}"}}
  end
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
Then /I should see Round Name "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Name "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Location "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Description "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Phone "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see Email "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /^I should see "([^"]*)" in the "([^"]*)" input$/ do |content, labeltext|
    find_field("#{labeltext}").value.should == content
end


Then /I should see Judge Name "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end


