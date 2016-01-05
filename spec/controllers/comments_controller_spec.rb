require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
   
	describe 'create' do
		before :each do
			@c = FactoryGirl.create(:competition)
			@r = FactoryGirl.create(:round)
			@qual = FactoryGirl.create(:qualification)
		end
		
		context "with valid attributes" do
		    it "creates a new comment" do
		    session[:user_type] = 'judge'
		      expect{
			post :create, :qualification_id => @qual.id, :comment => Hash["comment_des" => "bahut accha ladka tha bhai"], :competition_id => @c.id, :round_id => @r.id
		      }.to change(Comment, :count).by(1)
		    end
		    
		    it "redirects to the qualifications index" do
		      session[:user_type] = 'admin'
		      post :create, :qualification_id => @qual.id, :comment => Hash["comment_des" => "bahut accha ladka tha bhai"], :competition_id => @c.id, :round_id => @r.id
		      response.should redirect_to competition_round_qualifications_path

		    end
		  end
	end
    
	
end
