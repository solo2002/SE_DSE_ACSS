require 'rails_helper'
require 'spec_helper'

RSpec.describe ParticipantsController do 
	
	describe 'Participant' do
	 it 'has a valid factory' do
	  expect(build(:participant)).to be_valid
	 end
	end
    
    	describe "GET #index" do
		before :each do
		#@p = Participant.new({ :p_name => 'one', :p_loc => 'any', :p_phone => '89', :p_email => 'xyz', :p_des => 'one' })
		@p = FactoryGirl.create(:participant)
		end
		it "should show an array of participants" do
			session[:user_type] = 'admin'
			get :index, :id => @p, :sort => 'p_loc'
			#@p[:p_name].should == 'one'
			assigns(:participants).should eq([@p])
		end
		it "should redirect to welcome page if not logged in" do
		      get :index, :id => nil
		      response.should redirect_to root_path
			
		end
	end
	
	describe '#new' do
		before :each do
		       #parti=Participant.new({:p_name => 'one', :p_loc => 'TAMU', :p_phone => '1', :p_email => 'test', :p_des => 'any'})
		end
		it 'should add new participant' do
		    #@parti[:p_name].should == 'one'
		    #don't think that it needs any testing as the method is empty
		end
	end

	describe "#create" do
		context "with valid attributes" do
		    it "creates a new participant" do
		    session[:user_type] = 'admin'
		      expect{
			post :create, participant: FactoryGirl.attributes_for(:participant)
		      }.to change(Participant, :count).by(1)
		    end
		    
		    it "redirects to the new participant" do
		      session[:user_type] = 'admin'
		      post :create, participant: FactoryGirl.attributes_for(:participant)
		      response.should redirect_to new_participant_enrollment_path(Participant.last)

		    end
		  end
	end
	
	describe "GET #show" do
	    	it "renders the #show view" do
		    p = FactoryGirl.create(:participant)
		    session[:user_type] = 'admin'
		    get :show, :id => p
		    assigns(:participant).should eq(p)
		end
	end
	
	describe "GET #edit" do
	    	it "renders the #show view" do
		    p = FactoryGirl.create(:participant)
		    session[:user_type] = 'admin'
		    get :edit, :id => p
		    assigns(:participant).should eq(p)
		end
	end
   
    describe 'PUT #update' do
	let(:attr) do 
	    { :p_name => 'Eve', :password => 'better_pass', :p_phone => '1234577890', :p_loc => "Texas" }
      	end

	before(:each) do
		@p = FactoryGirl.create(:participant)
		session[:user_type] = 'admin'
		put :update, :id => @p, :participant => attr
		@p.reload
	end

   
	it "should update competition value" do
		session[:user_type] = 'admin'
		assigns(:participant).should eq(@p)
		response.should redirect_to new_participant_enrollment_path(@p)
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
	    @p = FactoryGirl.create(:participant)
	  end
	  
	  it "deletes the participant" do
	    session[:user_type] = 'admin'
	    expect{
	      delete :destroy, id: @p        
	    }.to change(Participant,:count).by(-1)
	  end
	    
	  it "redirects to participants #index" do
	    session[:user_type] = 'admin'
	    delete :destroy, id: @p
	    response.should redirect_to participants_path
	  end
	end	
	
	describe "GET #report" do
    	before :each do
		@c = FactoryGirl.create(:competition)
		@p = FactoryGirl.create(:participant)
		@e = FactoryGirl.create(:enrollment)
		@r = FactoryGirl.create(:round)
		@qual = FactoryGirl.create(:qualification)
		@ques = FactoryGirl.create(:question)
		@s = FactoryGirl.create(:score)
		@cj = FactoryGirl.create(:competitions_judge)
		@comment = FactoryGirl.create(:comment)
    	end
	it 'should generate the participant report' do
		session[:user_type] = 'admin'
		get :report, :participant_id => @p.id 
		assigns(:questions).should eq([@ques])
		assigns("questionComments[1][1]]").should eq(@s.question_comment)
		assigns(:roundTotalScore[1][1]).should eq(10)

	end
	end

end

