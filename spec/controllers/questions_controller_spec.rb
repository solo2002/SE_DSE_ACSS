require 'rails_helper'
require 'spec_helper'

RSpec.describe QuestionsController, type: :controller do
	
    describe "#create" do
    	it 'should create question' do
    		#QuestionsController.stub(:create).and_return(double('Question'))
      		#post :create, {:id => "1"}
    	end
	end
	 describe '#new' do
    	before :each do
    		@q=Question.new({ :round_id => '1', :marks => '0'})
    	end
        it 'should add a new question' do
            @q[:marks].should == 0
        end
    end
	 
	
	describe "GET #index" do
		before :each do
		@q=Question.new({ :round_id => '1', :marks => '0'})
		
		end
	it "should show the question's marks is 1" do
		@c[:marks].should == '0'
	end
	end
=begin    describe '#new' do
    	before :each do
    		@question=Question.new('one', '0')
    	end
        it 'should return a new question object' do
            @question.should(be_an_instance_of Question)
        end
        
        it "throws an ArgumentError when given fewer than 2 parameters" do
			lambda {Question.new 'one'}.should raise_exception ArgumentError
	    end
=end
    describe "#question_details" do
        	before :each do
    		@question=Question.new(:question_details => 'one', :marks => '0')
        it "returns the correct question_details" do
            @question.question_details.should eql "one"
        end
    end
    describe "#marks" do
        	before :each do
    		@question=Question.new(:question_details => 'one', :marks => '0')
        it "returns the correct marks" do
            @question.marks.should eql "0"
        end
    end
    end
end   
end

