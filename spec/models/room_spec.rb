require 'spec_helper'
describe Room do
  describe "relationships" do
    it { should have_and_belong_to_many (:products) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end