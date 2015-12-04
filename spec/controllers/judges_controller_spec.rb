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
		    it "creates a new judge" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, judge: FactoryGirl.attributes_for(:judge)
		      }.to change(Judge, :count).by(1)
		    end
		    
		    it "redirects to the new judge" do
		      session[:user_type] = 'admin'
		      post :create, judge: FactoryGirl.attributes_for(:judge)
		      response.should redirect_to judge_path(1)

		    end
		  end
	end

    describe "GET #edit" do
    	before :each do
		@j = FactoryGirl.create(:judge)
    	end
	    it "renders the #show view" do
		    session[:user_type] = 'admin'
		    get :edit, :id => @j.id
		    assigns(:judge).should eq(@j)
		    end
    end

    describe 'PUT #update' do
	
	let(:attr) do 
	    { :j_name => 'new judge', :j_loc => 'Texas', :j_des => 'judge ka description', :j_phone => 9799851230, :password => 'updatepassword', :j_email => "judgeva@judgeva.com" }
      	end

	before(:each) do
		@j = FactoryGirl.create(:judge)
		@u = FactoryGirl.create(:judgeuser)
		session[:user_type] = 'admin'
		put :update, :id => @j.id, :judge => attr
		@j.reload
	end
	


   
	it "should update judge value" do
		session[:user_type] = 'admin'
		assigns(:judge).should eq(@j)
		response.should redirect_to judge_path(@j)
		end

	end
	
	describe 'DELETE destroy' do
	  before :each do
	    @j = FactoryGirl.create(:judge)
	  end
	  
	  it "deletes the competition" do
	    session[:user_type] = 'admin'
	    expect{
	      delete :destroy, id: @j        
	    }.to change(Judge,:count).by(-1)
	  end
	    
	  it "redirects to competitions #index" do
	    session[:user_type] = 'admin'
	    delete :destroy, id: @j
	    response.should redirect_to judges_path
	  end
	end	
   
end
