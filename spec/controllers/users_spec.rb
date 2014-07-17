require 'spec_helper'

describe UsersController do
  render_views

    it "should successfully load the new user page" do
      get :index
      expect(response.status).to eq 200
    end

    it "should create a new user" do
      post :create, user: {username: "hans", email: "han@solo.com", password: "password" }
      expect(User.last.username).to eq("hans")
    end

    it "should run the show action" do
      visit user_url(user)
      response.should render_template(:show)
      expect(response.status).to eq(200)
    end
end
