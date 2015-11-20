require 'rails_helper'
require 'spec_helper'

RSpec.describe QualificationsController, type: :controller do
    	
    describe '#new' do
    	before :each do
    		@qual=Qualification.new({:round_id => '1', :participant_id => '2'})
    	end
        it 'should add new qualification' do
            @qual[:participant_id].should == 2
        end
    end
    
    describe 'create' do
		it 'should create new qualification' do
			CompetitionsController.stub(:create).and_return(mock('Qualification'))
			post :create, {:id=>"1"} 
		end
	end
    describe "GET #index" do
		before :each do
		@c = Qualification.new({ :round_id => '1', :participant_id => '2'})
		end
	it "should show all array of qualifications" do
		@c[:participant_id].should == 2
	end
	end
end
