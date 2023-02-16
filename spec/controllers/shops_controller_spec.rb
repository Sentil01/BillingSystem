require 'rails_helper'

RSpec.describe ShopsController,test: :controller do

  describe "GET#index" do
    it "returns a success response" do

      get :index
      expect(response).to be_successful
    end

  end
  describe "GET#new" do
    it "returns a success response" do

      get :new
      expect(response).to be_successful
    end
  end
  describe "POST#create" do
    it "returns a success response" do
      shop=Shop.create(:name=>"A1")


      expect(shop).to be_valid
    end
  end
  describe "DELETE#destroy" do
    it "returns a success response" do
      shop=Shop.create(:name=>"A1")
      shop.destroy()
      expect(response.status).to eq(200)
    end
  end
end