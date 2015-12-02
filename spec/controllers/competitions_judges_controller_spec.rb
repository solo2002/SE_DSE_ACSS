require 'rails_helper'
require 'spec_helper'

RSpec.describe CompetitionsJudgesController, type: :controller do
    
	describe 'Round' do
		it 'has a valid factory' do
			expect(build(:round)).to be_valid
	end
	end

	describe "GET #index" do
		before :each do
			@c = FactoryGirl.create(:competition)
			@cj = FactoryGirl.create(:competitions_judge)
			@j = FactoryGirl.create(:judge)
		end
		it "should redirect to root path" do 
			get :index, :competition_id => @c.id 
			response.should redirect_to root_path

		end
		context "when logged in as admim" do 
			it "should show an array of competitions and sorted according to their names" do
			session[:user_type] = 'admin'
			get :index, :competition_id => @c.id 
			assigns(:competition).should eq(@c)
			assigns(:judges).should eq([@j])
			
			end
		end
	end
    

	describe 'create' do
		before(:each) do
			@c = FactoryGirl.create(:competition)
			@j = FactoryGirl.create(:judge)
		end
		context "with valid attributes" do
		    it "creates a new round" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, :arr_comp => Array.[](@c.id), :judge_id => @j.id 
			}.to change(CompetitionsJudge, :count).by(1)
		    end
		    
		    it "redirects to the judges index page" do
		      session[:user_type] = 'admin'
		      post :create, :arr_comp => Array.[](@c.id), :judge_id => @j.id 
		      response.should redirect_to judges_path

		    end
		  end
	end

    
end
