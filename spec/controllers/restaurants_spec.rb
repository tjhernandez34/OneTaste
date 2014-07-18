require 'spec_helper'

describe RestaurantsController do
  context "#index" do
    it "should collect all restaurants" do
      get :index
      assigns(:restaurants).should == Restaurant.all
    end
  end

  context "#search" do
    it "should collect search results" do
     restaurant =  Restaurant.create(name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY")
      post :search, search: "Bernie's Bistro"
      (assigns(:results)[0].name).should eq("Bernie's Bistro")
    end
  end

  context '#new' do
    it "should create a new restaurant object" do
      get :new
      assigns(:restaurant).should be_a(Restaurant)
    end
  end

  context '#create' do
    xit "should create a restaurant object" do
      post :create, restaurant: {name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY"}
      # should redirect_to(restaurant_path(3))
    end
  end
end
