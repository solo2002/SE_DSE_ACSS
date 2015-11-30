require 'rails_helper'

require 'spec_helper'

RSpec.describe CompetitionsController do 

	describe 'Competition' do
	 it 'has a valid factory' do
	  expect(build(:competition)).to be_valid
	 end
	end
	
	describe "GET #index" do
		before :each do
			#@c = Competition.new({:competition_name => 'one', :competition_des => 'first one', :no_of_rounds => 3})
			@c = FactoryGirl.create(:competition)
		end
		it "when logged in as admin should show an array of competitions and sorted according to their names" do
		session[:user_type] = 'admin'
		get :index, :id => @c, :display_items => Competition.count, :sort => 'competition_name'
		assigns(:competitions).should eq([@c])
		
		end
		it "when logges in as judge should show all competitions relevant for that judge" do 
		#@j = Judge.new({:j_name => 'Anavil', })
		#######pending 
		end
		it "should redirect to welcome page if not logged in" do
		      get :index, :id => nil
		      response.should redirect_to root_path
			
		end

	end
    
    describe '#new' do
    	before :each do
    		#@comp=Competition.new({:competition_name => 'one', :competition_des => 'any'})
		@c = FactoryGirl.create(:competition)
    	end
        it 'should add new competition' do
            #don't think that it needs any testing new method is basically doing nothing 
        end
    end


    describe "GET #show" do
	    it "renders the #show view" do
		    c = FactoryGirl.create(:competition)
		    session[:user_type] = 'admin'
		    get :show, :id => c
		    assigns(:competition).should eq(c)
		    
		    
		    end
    end

	describe 'create' do
		context "with valid attributes" do
		    it "creates a new competition" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, competition: FactoryGirl.attributes_for(:competition)
		      }.to change(Competition, :count).by(1)
		    end
		    
		    it "redirects to the new competition" do
		      session[:user_type] = 'admin'
		      post :create, competition: FactoryGirl.attributes_for(:competition)
		      response.should redirect_to Competition.last

		    end
		  end
	end

    describe "GET #edit" do
	    it "renders the #show view" do
		    c = FactoryGirl.create(:competition)
		    session[:user_type] = 'admin'
		    get :edit, :id => c
		    assigns(:competition).should eq(c)
		    
		    
		    end
    end

    describe 'PUT #update' do
	
	let(:attr) do 
	    { :competition_name => 'two', :competition_des => 'edited competition' }
      	end

	before(:each) do
		@fake_competition = FactoryGirl.create(:competition)
		session[:user_type] = 'admin'
		put :update, :id => @fake_competition, :competition => attr
		@fake_competition.reload
	end

   
	it "should update competition value" do
		session[:user_type] = 'admin'
		assigns(:competition).should eq(@fake_competition)
		response.should redirect_to(competition_path(@fake_competition))
		end

	it 'should call the model method that performs the competition update' do
		
	end
	it 'should redirect to details template for rendering' do
		#response.should redirect_to(competition_path @fake_competition)
	end
	it 'should make updated info available to template' do
		#assigns(:competition).should eql(@fake_competition)
	end
	end
	
	describe 'DELETE destroy' do
	  before :each do
	    @competition = FactoryGirl.create(:competition)
	  end
	  
	  it "deletes the competition" do
	    session[:user_type] = 'admin'
	    expect{
	      delete :destroy, id: @competition        
	    }.to change(Competition,:count).by(-1)
	  end
	    
	  it "redirects to competitions #index" do
	    session[:user_type] = 'admin'
	    delete :destroy, id: @competition
	    response.should redirect_to competitions_path
	  end
	end	
end

