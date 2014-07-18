require 'spec_helper'

describe SessionsController do

  context "login page" do
    it "should be return success status" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  context "#create" do
      let(:user) { User.create(username: "hans", email: "han@solo.com", password: "password") }
    it "should redirect to index if user is authenticated" do
      # params[:session][:email] = user.email
      # params[:session][:password] = user.password
      post :create, session: {email: user.email, password: "password"}
      expect(session[:user_id]).to eq(user.id)
      should redirect_to(root_path)
    end

    it "should redirect to /login if user is not authenticated" do
      post :create, session: {email: user.email, password: "wrong"}
      should redirect_to('/login')
    end
  end

  context "#destroy" do
    let(:user) { User.create(username: "hans", email: "han@solo.com", password: "password") }
    it "should have nothing assigned in the session" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
    it "should redirect to root" do
      delete :destroy
      should redirect_to(root_path)
    end
  end


end
