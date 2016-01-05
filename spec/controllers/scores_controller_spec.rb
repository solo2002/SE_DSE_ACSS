require 'rails_helper'
require 'spec_helper'

RSpec.describe ScoresController, type: :controller do
    
	describe "GET #index" do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@ques = FactoryGirl.create(:question)
			@p = FactoryGirl.create(:participant)
			@s = FactoryGirl.create(:score)
			@comments = FactoryGirl.create(:comment)
			@qual = FactoryGirl.create(:qualification)

		end
		
		context "logged in as admin" do
			it "shows an array of qualifications" do
			session[:user_type] = 'admin'
			get :index, :round_id => @r.id, :participant_id => @p.id, :question_id => @ques.id 
			assigns(:question).should eq(@ques)
			end
		end
	end
    
    describe '#new' do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@ques = FactoryGirl.create(:question)
			@qual = FactoryGirl.create(:qualification)
		end
        it 'should render the page for adding new score' do
		session[:user_type] = 'admin'
			get :new, :round_id => @r.id, :question_id => @ques.id, :competition_id => @c.id , :qualification_id => @qual.id
		assigns(:round).should eq(@r)
        end
    end



	describe 'create' do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@ques = FactoryGirl.create(:question)
			@qual = FactoryGirl.create(:qualification)
		end
		
		context "adding to first round" do
		    it "creates a new qualification" do
		    session[:user_type] = 'admin'
		    session[:user_id] = 1
		      expect{
			 post :create, :competition_id => @c.id, :round_id => @r.id,:question_id => @ques.id, :qualification_id => @qual.id,:question_comments => "awesome", :scores => Array.[](1)			      }.to change(Score, :count).by(1)
		    end
	    
		    it "redirects to the questions index page" do
		      session[:user_type] = 'admin'
		      post :create, :competition_id => @c.id, :round_id => @r.id,:question_id => @ques.id, :qualification_id => @qual.id,:question_comments => "awesome", :scores => Array.[](1)
			 response.should redirect_to new_competition_round_qualification_comment_path(@c,@r, @qual)

		    end

		end
	end
    
    

end
