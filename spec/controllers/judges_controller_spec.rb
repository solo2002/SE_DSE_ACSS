require 'rails_helper'

require 'spec_helper'

describe JudgesController do 
   describe "GET #show" do
 	before :each do
            @fake_c = double(Judge, :judge_id => 1, :j_des => 'one')
        end
        it "should show the judge with id" do
        	Judge.should_receive(:find).with("1").and_return(@fake_c)
			get :show, {:id=>"1"}
        end
    end

end
