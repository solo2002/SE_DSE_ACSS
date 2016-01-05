require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the QualificationsHelper. For example:
#
# describe QualificationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe QualificationsHelper, type: :helper do
  describe "score calculation"do 
  	it "assigns score to 0 if scores is empty"do
		expect(helper.calc_score(1,1)).to eq(0)
	end
  	it "assigns correct score if scores is created"do
		@s = FactoryGirl.create(:score)
		@p = FactoryGirl.create(:participant)
		@r = FactoryGirl.create(:round)
		expect(helper.calc_score(@p,@r)).to eq(10)
	end
  end

end
