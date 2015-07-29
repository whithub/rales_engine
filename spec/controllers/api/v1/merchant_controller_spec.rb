require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  context "#index" do
    it "returns all the merchants" do
      merchant_1 = create(:merchant, name: 'Target Store')
      merchant_2 = create(:merchant, name: 'Staples')

      get :index, format: :json
      expect(response).to have_http_status(:ok)

      merchants_response = JSON.parse(response.body)
      expect(merchants_response['merchants'].count).to eq(2)

      merchant = merchants_response['merchants'].first
      expect(merchant['name']).to eq('Target Store')
    end
  end

  context "#show" do
    it "returns the specific merchant" do
      merchant = create(:merchant, name: 'Target Store')

      get :show, id: merchant.id, format: :json
      expect(response).to have_http_status(:ok)

      merchants = JSON.parse(response.body)

      expect(merchants['name']).to eq('Target Store')
    end
  end

  context "#items" do
    it "returns all items for that merchant" do
      other_item = create(:item, name: 'hula hoop')
      merchant = create(:merchant, items: [build(:item, name: 'toy'), build(:item, name: 'whistle')])

      get :items, id: merchant.id, format: :json

      merchant = JSON.parse(response.body)
      expect(merchant['name']).to eq("Poptarts")
      expect(merchant['items'].first['name']).to eq("toy")
      expect(merchant['items'].last['name']).to eq("whistle")
      expect(merchant['items'].count).to eq(2)
    end
  end

  context ""
end

