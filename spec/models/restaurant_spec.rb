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
end
