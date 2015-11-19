require 'rails_helper'

require 'spec_helper'

describe JudgesController do 
   describe "GET #show" do
 	before :each do
            @fake_j = double(Judge, :judge_id => 1, :j_des => 'one')
        end
        it "should show the judge with id" do
        	Judge.should_receive(:find).with("1").and_return(@fake_c)
			get :show, {:id=>"1"}
        end
    end
    describe '#new' do
    	before :each do
    		@j=Judge.new({:j_phone => '1', :j_name => '2'})
    	end
        it 'should add new judge' do
            @j[:j_name].should == '2'
        end
    end
    
    describe 'create' do
		it 'should create new qualification' do
			JudgesController.stub(:create).and_return(mock('judge'))
			post :create, {:id=>"1"} 
		end
	end
    describe "GET #index" do
		before :each do
		@j = Judge.new({ :j_phone => '1', :j_name => '2'})
		#@c=mock(Competition, :competition_name => 'one', :competition_des => 'any')
		end
	it "should show all array of judges" do
		@j[:j_name].should == '2'
	end
	end
end
