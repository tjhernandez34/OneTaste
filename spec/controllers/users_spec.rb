require 'spec helper'

describe UsersController do
  context "sign up" do
    it "should successfully load the new user page" do
      get :new
      expect(response.status).to eq 200
    end

    it "should create a new user" do
      # get :create {  }
    end
  end
end
