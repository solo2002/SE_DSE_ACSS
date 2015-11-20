require 'rails_helper'
require 'spec_helper'
RSpec.describe EnrollmentsController, type: :controller do

    describe '#new' do
    	before :each do
    		@e=Enrollment.new({:competition_id => '1', :participant_id => '2'})
    	end
        it 'should add a new enrollment' do
            @e[:participant_id].should == 2
        end
    end
    
    describe "GET #index" do
		before :each do
		    @e=Enrollment.new({:competition_id => '1', :participant_id => '2'})
		end
	it "should show an array of enrollments" do
		#@c[:participant_id].should == 2
	end
	end
end
