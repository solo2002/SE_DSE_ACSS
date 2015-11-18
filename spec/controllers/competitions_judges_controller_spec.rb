require 'rails_helper'
require 'spec_helper'

RSpec.describe CompetitionsJudgesController, type: :controller do
    
    describe '#new' do
    	before :each do
    		@cj=CompetitionsJudgesController.new()
    	end
        it 'should add a new competition judge' do
            #@cj[:judge_id].should == 1
        end
    end

 
	describe "GET #index" do
		before :each do
		@cj=CompetitionsJudgesController.new()
		
		end
	it "should show all array of qualifications" do
		
	end
	end
end
