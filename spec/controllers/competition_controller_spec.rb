require 'rails_helper'

require 'spec_helper'

describe CompetitionsController do 
	describe "GET #show" do
 	before :each do
            @fake_c = double(Competition, :competition_id => 1, :competition_name => 'one', :competition_des => 'any')
        end
        it "should show the competition with id" do
        	Competition.should_receive(:find).with("1").and_return(@fake_c)
			get :show, {:id=>"1"}
        end
    end
    describe 'updating competition info' do
    before :each do
    	@fake_competition = double(Competition, :competition_id => 1, :competition_name => 'one', :competition_des => 'any')
	end
   
	it "should update competition value" do
		#Competition.should_receive(:find).with("1").and_return(@fake_competition)
      	#put :update, {:id => "1", :competition => @fake_competition }
      	#response.should redirect_to(competition_path(@fake_competition))
	end
	it 'should call the model method that performs the competition update' do
		true
	end
	it 'should redirect to details template for rendering' do
		#response.should redirect_to(competition_path @fake_competition)
	end
	it 'should make updated info available to template' do
		#assigns(:competition).should == @fake_competition
	end
	end
    describe "#create" do
    	it 'should create competition' do
    		#CompetitionsController.stub(:create).and_return(double('Competition'))
      		#post :create, {:id => "1"}
    	end
	end
    describe '#new' do
    	before :each do
    		@comp=Competition.new({:competition_name => 'one', :competition_des => 'any'})
    	end
        it 'should add new competition' do
            @comp[:competition_name].should == 'one'
        end
    end
end   
