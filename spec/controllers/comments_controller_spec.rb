require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
   
     describe '#new' do
    	before :each do
    		@j=Comment.new({:comment_des => '1'})
    	end
        it 'should add new comment' do
            @j[:comment_des].should == '1'
        end
    end
    
    describe 'create' do
		it 'should create new comment' do
			CommentsController.stub(:create).and_return(mock('comment'))
			post :create, {:id=>"1"} 
		end
	end
	
    describe "GET #index" do
		before :each do
		@j = Comment.new({ :comment_des => '1'})
		#@c=mock(Competition, :competition_name => 'one', :competition_des => 'any')
		end
	it "should show all array of comments" do
		@j[:comment_des].should == '1'
	end
	end
end