require 'spec_helper'

describe UsersController do
  render_views

    it "should successfully load the new user page" do

      visit '/restaurants'
      expect(response.status).to eq 200
    end

    it "should create a new user" do
      post :create, user: {username: "hans", email: "han@solo.com", password: "password" }
      expect(User.last.username).to eq("hans")
    end

    it "should run the show action" do
      user = User.create(username: "hans", email: "han@solo.com", password: "password")
      visit user_path(user)
      response.should render_template(:show)
      expect(response.status).to eq(200)
    end
end
