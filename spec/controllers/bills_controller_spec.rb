require 'rails_helper'

RSpec.describe BillsController,test: :controller do
  describe "GET#index" do
    it "returns a success response" do
      shop=Shop.create(:name=>"A1")
      get :index,params: {shop_id: shop.id}
      expect(response).to be_successful
    end
  end
  describe "GET#new" do
    it "returns a success response" do
      shop=Shop.create(:name=>"A1")
      get :new,params: {shop_id: shop.id}
      expect(response).to be_successful
    end
  end
  describe "POST#create" do
    it "returns a success response" do
      shop=Shop.create(:name=>"A1")
      product=shop.products.new( :price=>20, :tax=>1, :quantity=>100, :shop_id=>1, :product_name=>"soap")
      # post :create,params: {shop_id: shop.id}
      bill=shop.bills.build(:email_id=>"sentil@gmail.com", :name=>"Sentil", :amount_paid=>2000, :shop_id=>shop.id,amounts_attributes: [ :five_hundred=>4, :hundred=>0, :fifty=>0, :ten=>0, :five=>0, :two=>0, :one=>0])
      expect(bill).to be_valid
    end
  end
end