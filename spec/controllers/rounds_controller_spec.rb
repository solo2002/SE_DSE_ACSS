require 'rails_helper'

require 'spec_helper'

describe RoundsController do
	describe "GET #show" do
 	before :each do
            @fake_r = double(Round, :round_name => "one", :round_des => 'one', :no_of_participants => 1)
        end
        it "should show the round with id" do
        	#Round.should_receive(:find).with("1").and_return(@fake_r)
			#get :show, {:id=>"1"}
        end
    end
    describe '#new' do
    	before :each do
    		@rou=Round.new({:round_name => "one", :round_des => 'one', :no_of_participants => 1})
    	end
        it 'should add new round' do
            @rou[:round_name].should == 'one'
        end
    end
end 