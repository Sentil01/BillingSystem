require 'rails_helper'

RSpec.describe Bill,type: :model do
  context "Valid Cases" do
    describe "Checking Associations" do
      it { Bill.reflect_on_association(:carts).macro.should eq(:has_many) }
    end
    describe "Checking Associations" do
      it { Bill.reflect_on_association(:amounts).macro.should eq(:has_many) }
    end
    describe "Checking Associations" do
      it { Bill.reflect_on_association(:balance_denos).macro.should eq(:has_many) }
    end
    describe "Bill Creation" do
      it "Create a new Bill" do
        shop=Shop.create(:name=>"A1")
        product=shop.products.new( :price=>20, :tax=>1, :quantity=>100, :shop_id=>1, :product_name=>"soap")
        bill=shop.bills.build(:email_id=>"sentil@gmail.com", :name=>"Sentil", :amount_paid=>2000, :shop_id=>shop.id,amounts_attributes: [ :five_hundred=>4, :hundred=>0, :fifty=>0, :ten=>0, :five=>0, :two=>0, :one=>0])
        expect(bill).to be_valid
      end
    end
  end
  context "Invalid Cases" do
    describe "Invalid Associations" do
      it "Invalid" do
        expect(Bill.reflect_on_association(:carts)).not_to eq(:has_one)

      end

    end


  end

end