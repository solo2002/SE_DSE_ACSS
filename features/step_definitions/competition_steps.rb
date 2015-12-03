
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
	fill_in("cred_email_id", :with => "admin@admin.com")
	fill_in("cred_password", :with => "adminpass")
  
	click_button("Login")
  #save_and_open_page
end

Then /^I should see "([^"]*)" in the "([^"]*)" on "([^"]*)"  $/ do |content, labeltext, page|
    #visit path_to(path)
    #find_field("#{labeltext}").value.should == content
    #page.should have_field("#{labeltext}", with: "#{content}")
    expect(page).to have_field("#{labeltext}", with: "#{content}")
end



