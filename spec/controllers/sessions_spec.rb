require 'spec_helper'

describe SessionsController do

  context "login page" do
    it "should be return success status" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  context "#create" do
    it "should redirect to index if user is authenticated" do

    end

    it "should redirect to /login if user is not authenticated" do
    end
  end


end
