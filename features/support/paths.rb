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
      when /^the Competitions page$/ then '/competitions'
      when /^the Participants page$/ then '/participants'
      when /^the Details about Round "([^"]+)"$/ then competition_rounds_path
      when /^the Details about Competition "([^"]+)"$/ then competition_path(Competition.find_by_competition_name($1).id)
      when /^the Details about Participant "([^"]+)"$/ then new_participant_path
      when /^the Details about "([^"]+)" page$/ then judge_path(Judge.find_by_j_name($1).id)
      when /^Qualifications of "([^"]+)" competition and "([^"]+)" round$/ then competition_round_qualifications_path(Competition.find_by_competition_name($1).id,Round.find_by_round_name($2).id)
      when /^Questions of "([^"]+)" competition and "([^"]+)" round$/ then competition_round_questions_path(Competition.find_by_competition_name($1).id,Round.find_by_round_name($2).id)
      when /^Report Index$/ then '/participants/1/report'
      when /^Report of participant "([^"]+)"$/ then participant_report_path(Participant.find_by_p_name($1).id)
      when /^Rounds of "([^"]+)" page$/ then competition_rounds_path(Competition.find_by_competition_name($1).id)
      when /^Report of participant "([^"]+)" and round "([^"]+)" and question "([^"]+)"$/ then round_participant_question_scores_path(Round.find_by_round_name($2).id,Participant.find_by_p_name($1).id,Question.find_by_question_details($3).id)
      when /^Edit page of "([^"]+)" Competition$/ then edit_competition_path(Competition.find_by_competition_name($1).id)
      when /^New Comments of "([^"]+)" competition and "([^"]+)" round and "([^"]+)" qualification$/ then new_competition_round_qualification_comment_path(Competition.find_by_competition_name($1).id,Round.find_by_round_name($2).id,Qualification.find_by_id($3))
      when /^Qualifications page of "([^"]+)" competition and "([^"]+)" round$/ then competition_round_qualifications_path(Competition.find_by_competition_name($1).id,Round.find_by_round_name($2).id)
      
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
