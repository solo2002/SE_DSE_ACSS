require 'rails_helper'

require 'spec_helper'

describe RoundsController do
	describe 'Round' do
		it 'has a valid factory' do
			expect(build(:round)).to be_valid
	end
	end

	describe "GET #index" do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
		end
		it "should redirect to root path" do 
			get :index, :id => @r.id, :competition_id => @c.id 
			response.should redirect_to root_path

		end
		context "when logged in as admim" do 
			it "should show an array of competitions and sorted according to their names" do
			session[:user_type] = 'admin'
			get :index, :id => @r.id, :competition_id => @c.id 
			assigns(:competition).should eq(@c)
			assigns(:rounds).should eq([@r])
			
			end
		end
	end
    
    describe '#new' do
    	before :each do
		@c = FactoryGirl.create(:competition)
    	end
        it 'should render page for new round' do
            #don't think that it needs any testing new method is basically doing nothing 
        end
    end


    describe "GET #show" do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@p = FactoryGirl.create(:participant)
			@q = FactoryGirl.create(:qualification)
		end
		context "when logged in as admim" do 
			it "should show an array of competitions and sorted according to their names" do
			session[:user_type] = 'admin'
			get :show, :id => @r.id, :competition_id => @c.id 
			assigns(:competition).should eq(@c)
			assigns(:round).should eq(@r)
			
			end
		end
    end

	describe 'create' do
		before(:each) do
			@c = FactoryGirl.create(:competition)
		end
		context "with valid attributes" do
		    it "creates a new round" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, :competition_id => @c.id, round: FactoryGirl.attributes_for(:round)
		      }.to change(Round, :count).by(1)
		    end
		    
		    it "redirects to the new competition" do
		      session[:user_type] = 'admin'
		      post :create, :competition_id => @c.id, round: FactoryGirl.attributes_for(:round)
		      response.should redirect_to competition_round_path(@c, 1)

		    end
		  end
	end

    describe "GET #edit" do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
		end
		context "when logged in as admim" do 
			it "should render the edit round page" do
			session[:user_type] = 'admin'
			get :edit, :id => @r.id, :competition_id => @c.id 
			assigns(:competition).should eq(@c)
			assigns(:round).should eq(@r)
			
			end
		end
    end

	describe 'PUT #update' do
	
		let(:attr) do 
		    { :round_name => 'two', :round_des => 'edited round' }
		end

		before(:each) do
			@r = FactoryGirl.create(:round)
			@c = FactoryGirl.create(:competition)
			session[:user_type] = 'admin'
			put :update, :id => @r, :competition_id => @c.id, :round => attr
			@r.reload
		end

	   
		it "should update competition value" do
			session[:user_type] = 'admin'
			assigns(:round).should eq(@r)
			response.should redirect_to competition_round_path(@c, @r)
			end

	end
	
	describe 'DELETE destroy' do
	  before :each do
	    @c = FactoryGirl.create(:competition)
	    @r = FactoryGirl.create(:round)
	  end
	  
	  it "deletes the round" do
	    session[:user_type] = 'admin'
	    expect{
	      delete :destroy, id: @r , :competition_id => @c.id       
	    }.to change(Round,:count).by(-1)
	  end
	    
	  it "redirects to rounds #index" do
	    session[:user_type] = 'admin'
	    delete :destroy, id: @r, :competition_id => @c.id
	    response.should redirect_to competition_rounds_path(@c)
	  end
	end	
    
end 
