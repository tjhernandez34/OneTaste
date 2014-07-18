require 'spec_helper'

describe RestaurantsController do
  render_views

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
    it "should create a restaurant object" do
      post :create, restaurant: {name: "Bernie's Bistro", creator_id: "5", category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY"}
      # bernies = Restaurant.find_by(name: "Bernie's Bistro")
      # assigns(:restaurant).should be_a(Restaurant)
      expect(response).to be_redirect
    end
  end

  context '#edit' do
    let(:bernies) { Restaurant.create(name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY") }

    it "should assign an instance method to the restaurant that is being edited" do
      get :edit, id: bernies.id
      (assigns(:restaurant).name).should eq("Bernie's Bistro")
    end
  end

  context '#update' do
     let(:bernies) { Restaurant.create(name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY") }
    it "should redirect to the restaurant view page" do
      patch :update, id: bernies.id, restaurant: {name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "127 Fake Street", city: "Gotham", state: "NY"}
      expect(response).to be_redirect
    end
  end

  context '#show' do
    let(:bernies) { Restaurant.create(name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY") }
    it "should return a valid response" do
      get :show, id: bernies.id
      expect(response.status).to eq(200)
    end
  end
end
