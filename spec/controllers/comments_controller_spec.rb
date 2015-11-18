require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    before :each do
	@fake_comments = mock('movie1',:movie_id=>111, :title=>'alien', :director=>'George Lucas')
	@fake_results = [@fake_movie1, mock('movie4',:movie_id=>114, :title=>'alien', :director=>'George Lucas')]
  end

    
     describe '#new' do
    	before :each do
    		@question=Question.new('one', '0')
    	end
        it 'should return a new question object' do
            @question.should(be_an_instance_of Question)
        end
        
        it "throws an ArgumentError when given fewer than 2 parameters" do
			lambda {Question.new 'one'}.should raise_exception ArgumentError
	    end
    end
    
    describe "#create" do
    	it 'should create comments' do
    		CommentsController.stub(:create).and_return(double('Comment'))
      		post :create, {:competition_id => "1"}
    	end
	end

end
