require 'spec_helper'

describe Restaurant do
  context "validations" do
    it { should validate_uniqueness_of :street_address }
    it { should validate_presence_of :name }
    it { should validate_presence_of :state }
    it { should validate_presence_of :city }
  end

  context "associations" do
    it { should have_many :reviews }
    it { should have_many :votes }
    it { should belong_to(:creator).class_name("User") }
  end

  context "#self.search" do
    Restaurant.create(name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY")

    it "should return restaurant when restaurant name is entered exactly" do
      expect(Restaurant.search("Bernie's Bistro").first).to be_kind_of Restaurant
      expect(Restaurant.search("Bernie's Bistro").first.name).to eq("Bernie's Bistro")
    end

    it "should return matching restaurants when category is entered" do
      expect(Restaurant.search("Vegetarian").first.name).to eq("Bernie's Bistro")
    end

    it "should return restaurants that match the city searched" do
      expect(Restaurant.search("Gotham").first.name).to eq("Bernie's Bistro")
    end

    it "should return restaurants when incomplete name is entered" do
      expect(Restaurant.search("Bernie").first.name).to eq("Bernie's Bistro")
    end

    it "should return restaurant when search entry capitalization doesn't match database" do
      expect(Restaurant.search("vegetarian").first.name).to eq("Bernie's Bistro")
    end
  end

  let(:restaurant) {Restaurant.create(name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY")
}

  it "should have a name" do
    expect(restaurant.name).to eq("Bernie's Bistro")
  end

  it "should have a creator_id" do
    expect(restaurant.creator_id).to eq(5)
  end

  it "should have a street_address" do
    expect(restaurant.street_address).to eq("125 Fake Street")
  end

  it "should have a city and state" do
    expect(restaurant.city).to eq("Gotham")
    expect(restaurant.state).to eq("NY")
  end

  it "should have a category" do
    expect(restaurant.category).to eq("Vegetarian")
  end

end
