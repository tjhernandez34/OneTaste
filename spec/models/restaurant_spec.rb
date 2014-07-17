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
    it { should belong_to :creator }
  end

  context "#self.search" do
    it "should return restaurant when restaurant name is entered exactly" do
      expect(Restaurant.search("Bernie's Bistro")[0]).to be_kind_of Restaurant
      expect(Restaurant.search("Bernie's Bistro")[0].name).to eq("Bernie's Bistro")
    end

    it "should return matching restaurants when category is entered" do
    end
  end
end
