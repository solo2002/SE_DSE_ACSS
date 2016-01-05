require 'rails_helper'
require 'spec_helper'
RSpec.describe EnrollmentsController, type: :controller do

	describe 'Enrollment' do
	 it 'has a valid factory' do
	  expect(build(:enrollment)).to be_valid
	 end
	end
	
	describe "GET #index" do
		it "should redirect to welcome page if not logged in" do
		      get :index, :id => nil
		      response.should redirect_to root_path
			
		end
		
		before :each do
			@c = FactoryGirl.create(:competition, :id => 1)
			@e = FactoryGirl.create(:enrollment)
			@p = FactoryGirl.create(:participant)
		end

		context "when logged in as admin" do 
			it "should show an array of competitions and sorted according to their locations" do
				session[:user_type] = 'admin'
				get :index, :competition_id => @c.id, :sort => 'p_loc' 
				assigns(:participants).should eq([@p])
				end
			it "should sort according to according to their names" do
				session[:user_type] = 'admin'
				get :index, :competition_id => @c.id, :sort => 'P_Name' 
				assigns(:participants).should eq([@p])
				end
		end

	end

    
    describe '#new' do
    	before :each do
		@c = FactoryGirl.create(:competition)
		@p = FactoryGirl.create(:participant)
		@e = FactoryGirl.create(:enrollment)
		@r = FactoryGirl.create(:round)
		@q = FactoryGirl.create(:question)
		@s = FactoryGirl.create(:score)
    	end
        it 'should render the new enrollments page' do
		session[:user_type] = 'admin'
		get :new, :participant_id => @p.id
		assigns(:competitions).should eq([@c])

        end
    end


    describe "GET #show" do
	    it "renders the #show view" do
		    e = FactoryGirl.create(:enrollment)
		    session[:user_type] = 'admin'
		    get :show, :id => e
		    assigns(:enrollment).should eq(e)
		    end
    end

	describe 'create' do
		before :each do
			@c = FactoryGirl.create(:competition)
			@p = FactoryGirl.create(:participant)
			@r = FactoryGirl.create(:round)
			@q = FactoryGirl.create(:question)
			@s = FactoryGirl.create(:score)
		end
		
		context "with valid attributes" do
		    it "creates a new enrollment" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, :participant_id => @p.id, :competition_id => Array.[](@c.id)
		      }.to change(Enrollment, :count).by(1)
		    end
		    
		    it "redirects to the participants index page" do
		      session[:user_type] = 'admin'
		      post :create, :participant_id => @p.id, :competition_id => Array.[](@c.id)
		      response.should redirect_to participants_path

		    end
		  end
	end

    describe "GET #edit" do
	    it "renders the #show view" do
		    e = FactoryGirl.create(:enrollment)
		    session[:user_type] = 'admin'
		    get :edit, :id => e
		    assigns(:enrollment).should eq(e)
		    end
    end

end
