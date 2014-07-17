require 'spec_helper'

describe Vote do
  context "validations" do
    it { should validate_presence_of :voter }
  end

  context "associations" do
    it { should belong_to :review }
    it { should belong_to :comment }
    it { should belong_to :restaurant }
    it { should belong_to :voter }
  end
end
