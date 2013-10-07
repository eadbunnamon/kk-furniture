require 'spec_helper'
describe Product do
  describe "relationships" do
    it { should have_and_belong_to_many (:rooms) }
    it { should have_many (:photos) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end
end