require 'rails_helper'

require 'spec_helper'

describe JudgesController do 
    
    
    describe "GET #index" do
		before :each do
			@j = FactoryGirl.create(:judge)
		end
	it "should show all array of judges" do
		get :index, :display_items => 1
		response.should redirect_to root_path

	end
	
	it "should show all array of judges" do
		session[:user_type] = 'admin'
		get :index, :display_items => 1
		assigns(:judges).should eq([@j])
	end
	
	it "should sort judges according to name" do
		session[:user_type] = 'admin'
		get :index, :display_items => 1, :sort => 'j_name'
		assigns(:judges).should eq([@j])
	end

	it "should sort judges according to locations" do
		session[:user_type] = 'admin'
		get :index, :display_items => 1, :sort => 'j_loc'
		assigns(:judges).should eq([@j])
	end
	end
    
    describe '#new' do
    	before :each do
		@j = FactoryGirl.create(:judge)
    	end
        it 'should add new judge' do
        	get :new 
        end
    end
    

    describe "GET #show" do
    	before :each do
		@j = FactoryGirl.create(:judge)
    	end
	    it "renders the #show view" do
		    session[:user_type] = 'admin'
		    get :show, :id => @j.id
		    assigns(:judge).should eq(@j)
		    end
    end

	describe 'create' do
		context "with valid attributes" do
		    it "creates a new competition" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, judge: FactoryGirl.attributes_for(:judge)
		      }.to change(Judge, :count).by(1)
		    end
		    
		    it "redirects to the new competition" do
		      session[:user_type] = 'admin'
		      post :create, judge: FactoryGirl.attributes_for(:judge)
		      response.should redirect_to judge_path(@j)

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
