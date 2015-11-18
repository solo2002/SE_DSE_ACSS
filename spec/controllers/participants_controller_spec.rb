require 'rails_helper'

require 'spec_helper'
describe ParticipantsController do 
	describe "GET #show" do
 	before :each do
            @fake_p = double(Participant, :participant_id => 1, :p_name => 'one', :p_loc => 'TAMU', :p_phone => '1', :p_email => 'test', :p_des => 'any')
        end
        it "should show the Participant with id" do
        	Participant.should_receive(:find).with("1").and_return(@fake_p)
			get :show, {:id=>"1"}
        end
        it "should authenticate the user" do
        	
        end
    end
    
    describe 'updating participant info' do
    before :each do
    	@fake_p = double(Participant, :participant_id => 1, :p_name => 'one', :p_loc => 'TAMU', :p_phone => '1', :p_email => 'test', :p_des => 'any')
	end
	
	it 'should call the model method that performs the participant update' do
		true
	end
	
	it 'should redirect to details template for rendering' do
		#response.should redirect_to(competition_path @fake_competition)
	end
	it 'should make updated info available to template' do
		#assigns(:competition).should == @fake_competition
	end
	describe "#create" do
    	it 'should create participant' do
    		#CompetitionsController.stub(:create).and_return(double('Competition'))
      		#post :create, {:id => "1"}
    	end
	end
    describe '#new' do
    	before :each do
    		@parti=Participant.new({:p_name => 'one', :p_loc => 'TAMU', :p_phone => '1', :p_email => 'test', :p_des => 'any'})
    	end
        it 'should add new participant' do
            @parti[:p_name].should == 'one'
        end
    end
    end
    describe "GET #index" do
		before :each do
		@p = Participant.new({ :p_name => 'one', :p_loc => 'any', :p_phone => '89', :p_email => 'xyz', :p_des => 'one', :round_id =>1 })
		end
	it "should show all array of participants" do
		@p[:p_name].should == 'one'
	end
	end
end