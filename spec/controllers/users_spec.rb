require 'spec_helper'

describe UsersController do
    it "should successfully load the new user page" do
      get :index
      expect(response.status).to eq 200
    end

    it "should create a new user" do
      post :create, user: {username: "hans", email: "han@solo.com", password: "password" }
      expect(User.last.username).to eq("hans")
    end

    it "should render the user info on a page" do
      user = User.create(username: "hans", email: "han@solo.com", password: "password")
      visit user_url(user)
      expect(response.status).to eq(200)
    end
end
