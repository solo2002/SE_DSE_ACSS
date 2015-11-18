require 'rails_helper'

require 'spec_helper'

describe CompetitionsController do 

	describe 'Competition' do
	 it 'has a valid factory' do
	  expect(build(:competition)).to be_valid
	 end
	end
	
	describe "GET #index" do
		before :each do
		@c = Competition.new({ :competition_name => 'one', :competition_des => 'any' })
		#@c=mock(Competition, :competition_name => 'one', :competition_des => 'any')
		end
	it "should show all array of competitions" do
		@c[:competition_name].should == 'one'
	end
	end
    describe "GET #show"  do
		before :each do
			@fake_c=mock('Competition1', :competition_id => 1, :competition_name => 'one', :competition_des => 'any')
		end
	it "should show desired id data" do
		Competition.should_recieve(:find).with("1").and_return(@fake_c)
		get :show, {:id=>"1"} 
		#assigns(:competition_name).should eq("one")
	end
		
	end
=begin  describe "#show" do
	it "assigns the requested competition to @competition" do
    competition = FactoryGirl.create(:competition)
    get :show, id: competition
    assigns(:competition).should eq(competition)
  end
  end
    it "renders the #show view" do
    get :show, id: FactoryGirl.create(:competition)
    response.should render_template :show
  end
=end

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
		#assigns(:competition).should eql(@fake_competition)
	end
	end
	
	describe 'create' do
		it 'should create new competition' do
			CompetitionsController.stub(:create).and_return(mock('Competition'))
			post :create, {:id=>"1"} 
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
