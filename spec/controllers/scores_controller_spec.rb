require 'rails_helper'
require 'spec_helper'

RSpec.describe ScoresController, type: :controller do
    
    	describe 'create' do
		it 'should create new score' do
			ScoresController.stub(:create).and_return(mock('Score'))
			post :score, {:id=>"1"} 
		end
	end
	
    describe '#new' do
    	before :each do
    		@s=Score.new({:question_id => '1', :marks => '1'})
    	end
        it 'should add new score' do
            @s[:marks].should == 1
        end
    end
    
     describe "GET #index" do
		before :each do
		@s = Score.new({:question_id => '1', :marks => '1'})
		end
	it "should show all array of scores" do
		@s[:marks].should == 1
	end
	end

end
