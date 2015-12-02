require 'rails_helper'
require 'spec_helper'

RSpec.describe QuestionsController, type: :controller do
	
	describe "GET #index" do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@ques = FactoryGirl.create(:question)
		end
		
		it "should redirect to welcome page if not logged in" do
		      get :index, :competition_id => @c.id, :round_id => @r.id
		      response.should redirect_to root_path
			
		end

		context "logged in as admin" do
			it "shows an array of qualifications" do
			session[:user_type] = 'admin'
			get :index, :round_id => @r.id, :competition_id => @c.id
			assigns(:questions).should eq([@ques])
			
			end
		end
	end
    
    describe '#new' do
    	before :each do
		@c = FactoryGirl.create(:competition)
		@r = FactoryGirl.create(:round)
    	end
        it 'should render the page for adding new question' do
		session[:user_type] = 'admin'
		get :new, :round_id => @r.id, :competition_id => @c.id
		assigns(:round).should eq(@r)
        end
    end



	describe 'create' do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
		end
		
		context "adding to first round" do
		    it "creates a new qualification" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, :competition_id => @c.id, :round_id => @r.id, :question => FactoryGirl.attributes_for(:question)			      }.to change(Question, :count).by(1)
		    end
	    
		    it "redirects to the questions index page" do
		      session[:user_type] = 'admin'
			post :create, :competition_id => @c.id, :round_id => @r.id, :question => FactoryGirl.attributes_for(:question)
		      response.should redirect_to competition_round_questions_path(@c,@r)

		    end

		end
	end
    
    describe "GET #show" do
	before :each do
		@c = FactoryGirl.create(:competition)
		@r = FactoryGirl.create(:round)
	end
	    it "renders the #show view" do
		    q = FactoryGirl.create(:question)
		    session[:user_type] = 'admin'
		    get :show, :id => q, :competition_id => @c.id, :round_id => @r.id
		    assigns(:question).should eq(q)
		    end
    end
    
    describe "GET #edit" do
	before :each do
		@c = FactoryGirl.create(:competition)
		@r = FactoryGirl.create(:round)
	end
	    it "renders the #show view" do
		    q = FactoryGirl.create(:question)
		    session[:user_type] = 'admin'
		    get :edit, :id => q, :competition_id => @c.id, :round_id => @r.id
		    assigns(:question).should eq(q)
		    end
    end

    describe 'PUT #update' do
	
	let(:attr) do 
	    { :category => 'Gesture', :marks => 10, :question_details => "new random question"}
      	end

	before(:each) do
		@c = FactoryGirl.create(:competition)
		@r = FactoryGirl.create(:round)
		@ques = FactoryGirl.create(:question)
		session[:user_type] = 'admin'
		put :update, :id => @ques.id, :competition_id => @c.id, :round_id => @r.id, :question => attr
		@ques.reload
	end

   
	it "should update competition value" do
		session[:user_type] = 'admin'
		assigns(:question).should eq(@ques)
		response.should redirect_to competition_round_questions_path(@c.id, @r.id)
		end

	end
	
	describe 'DELETE destroy' do
		before(:each) do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@ques = FactoryGirl.create(:question)
		  end
	  
	  it "deletes the question" do
	    session[:user_type] = 'admin'
	    expect{
	      delete :destroy, id: @ques.id, :competition_id => @c.id, :round_id => @r.id        
	    }.to change(Question,:count).by(-1)
	  end
	    
	  it "redirects to competitions #index" do
	    session[:user_type] = 'admin'
	      delete :destroy, id: @ques.id, :competition_id => @c.id, :round_id => @r.id        
	    response.should redirect_to competition_round_questions_path(@c.id, @r.id)
	  end
	end	
	 
	
end

