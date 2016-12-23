require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before :each do 
    @user = create :user
    session[:user_id] = @user.id
  end

  describe "POST #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end
    it "log in a user if exists" do
      post :create, {:id => @user.to_param, :user => {:email => @user.email, :password => @user.password} }
      expect(session[:user_id]).not_to be nil
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
