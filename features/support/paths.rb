# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

   # when /^the home\s?page$/
      #when /^the (Competitions )?home\s?page$/ then '/'

      when /^Welcome page$/ then '/'

      when /^Judges$/ then '/judges'
      when /^Add Judge$/ then '/judges/new'
      when /^the Competitions page$/ then '/competitions'
      when /^the Participant page$/ then '/participants'
      when /^Add Competition page$/ then '/competitions/new'
      when /^the Details about Round "([^"]+)"$/ then competition_rounds_path
      #when /^the Details about Competition "([^"]+)"$/ then new_competition_path
      when /^the Details about Competition "([^"]+)"$/ then competition_path(Competition.find_by_competition_name($1).id)
      when /^the Details about Participant "([^"]+)"$/ then new_participant_path
      when /^the Details about "([^"]+)" page$/ then judge_path(Judge.find_by_j_name($1).id)
      when /^ROOKIE$/ then 'competitions/1'
      when /^GO TO ROOKIE'S ROUNDS$/ then 'competitions/1/rounds'
      when /^FIRST$/ then 'competitions/1/rounds/2'
      when /^SENIOR$/ then 'competitions/3'
      when /^the (Judges )?home\s?page$/ then '/competitions/new'
        when /^Add New Competition page$/ then '/competitions/new'
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
