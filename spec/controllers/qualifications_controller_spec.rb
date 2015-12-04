require 'rails_helper'
require 'spec_helper'

RSpec.describe QualificationsController, type: :controller do
	
	describe 'Qualification' do
		it 'has a valid factory' do
			expect(build(:qualification)).to be_valid
	end
	end

	describe "GET #index" do
		before :each do
			#@c = Competition.new({:competition_name => 'one', :competition_des => 'first one', :no_of_rounds => 3})
			@p = FactoryGirl.create(:participant)
			@q = FactoryGirl.create(:qualification)
		end
		
		it "should redirect to welcome page if not logged in" do
		      get :index, :id => nil
		      response.should redirect_to root_path
			
		end

		context "logged in as admin" do

		it "shows an array of qualifications" do
		session[:user_type] = 'admin'
		get :index, :round_id => @q.round_id
		assigns(:participants).should eq([@p])
		
		end
		end

		context "logged in as judge" do

		it "show all participants with nil Score for that judge" do 
		session[:user_type] = 'judge'
		get :index, :round_id => @q.round_id
		assigns(:qualifications).should eq([@q])
		
		#@j = Judge.new({:j_name => 'Anavil', })
		#######pending 
		end
		end
	

	end
    
    describe '#new' do
    	before :each do
		@c = FactoryGirl.create(:competition)
		@r = FactoryGirl.create(:round)
		@p = FactoryGirl.create(:participant)
		@q = FactoryGirl.create(:qualification)
    	end
        it 'should render the page for adding new qualfications' do
		session[:user_type] = 'admin'
		get :new, :round_id => @r.id, :competition_id => @c.id
		assigns(:participants).should eq([@p])
		assigns(:rounds).should eq([@r])
        end
    end

	describe 'create' do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@r2 = FactoryGirl.create(:round2)
			@p = FactoryGirl.create(:participant)
			@q = FactoryGirl.create(:qualification)
		end
		
		context "adding to first round" do
			context "some participants are selected" do
			    it "creates a new qualification" do
			    session[:user_type] = 'admin'
			      expect{
				post :create, :first_round => @r2.id, :selected_participants => Hash["#{@p.id}" => 1], :competition_id => @c.id, :round_id => @r.id, :contestant_number => Hash["#{@p.id}" => 1]			      }.to change(Qualification, :count).by(1)
			    end
		    
			    it "redirects to the new competition" do
			      session[:user_type] = 'admin'
			      post :create, :first_round => @r2.id, :selected_participants => Hash[ "#{@p.id}" => 1], :competition_id => @c.id, :round_id => @r.id, :contestant_number => Hash["#{@p.id}" => 1], :add_part => 1  
			      response.should redirect_to competition_round_qualifications_path(@c,@r2)

			    end
			  end

			context "no participant is selected" do
			    it "redirects to the new competition when coming from competitions page" do
			      session[:user_type] = 'admin'
			      post :create, :first_round => @r2.id, :competition_id => @c.id, :round_id => @r.id, :contestant_number => Hash["#{@p.id}" => 1], :add_part => 1  
			      response.should redirect_to competition_add_part_to_round_path(@c)

			    end
			    it "redirects to the new competition when coming from competitions page" do
			      session[:user_type] = 'admin'
			      post :create, :first_round => @r2.id, :competition_id => @c.id, :round_id => @r.id, :contestant_number => Hash["#{@p.id}" => 1] 
			      response.should redirect_to new_competition_round_qualification_path(@c, @r)

			    end
			end
			
			context "no participant is selected" do
			    it "redirects to the new competition when coming from competitions page" do
			      session[:user_type] = 'admin'
			      post :create, :first_round => @r2.id, :selected_participants => Hash["#{@p.id}" => 1], :competition_id => @c.id, :round_id => @r.id, :contestant_number => Hash["#{@p.id}" => ""], :add_part => 1 
			      response.should redirect_to competition_add_part_to_round_path(@c)

			    end
			    it "redirects to the new competition when coming from competitions page" do
			      session[:user_type] = 'admin'
			      post :create, :first_round => @r2.id, :competition_id => @c.id, :round_id => @r.id, :contestant_number => Hash["#{@p.id}" => 1] 
			      response.should redirect_to new_competition_round_qualification_path(@c, @r)

			    end
			end
		end
	end

	
	
	
end

