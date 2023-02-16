require 'rails_helper'

RSpec.describe Shop,type: :model do
  context "Valid Cases" do
    describe "Checking Associations" do
      it { Shop.reflect_on_association(:bills).macro.should eq(:has_many) }
    end
    describe "Checking Associations" do
      it { Shop.reflect_on_association(:products).macro.should eq(:has_many) }
    end
    describe "Checking Associations" do
      it { Shop.reflect_on_association(:denominations).macro.should eq(:has_many) }
    end
    describe "Shop Creation" do
      it "Create a new Bill" do
        shop=Shop.create(:name=>"A1")

        expect(shop).to be_valid
      end
    end
  end
  context "Invalid Cases" do
    describe "Invalid Associations" do
      it "Invalid" do
        expect(Shop.reflect_on_association(:bills)).not_to eq(:has_one)

      end

    end



  end

end