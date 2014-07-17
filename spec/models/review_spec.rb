require 'spec_helper'

describe Review do
  context "validations" do
    it {should validate_presence_of :content }
    it {should validate_presence_of :reviewer }
  end

  context "associations" do
    it {should have_many :votes }
    it {should have_many :comments }
    it {should belong_to :reviewer }
    it {should belong_to :restaurant }
  end
end
