require 'spec_helper'

describe SessionsController do
  context "login page" do
    it "should be return success status" do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
