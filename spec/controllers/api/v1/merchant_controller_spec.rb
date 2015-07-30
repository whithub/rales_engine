require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  context "#index" do
    it "returns all merchants" do
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
    it "returns a single merchant" do
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

    it "returns the top x merchants ranked by total number of items sold" do
      skip
    end
  end

  context "revenue" do
    xit "returns total_revenue for that merchant" do
      merchant     = create(:merchant, name: "Target")
      customer     = create(:customer, first_name: "Billy", last_name: "Joel")
      item         = create(:item, name: 'hula hoop', description: 'endless hoop of fun', unit_price: 4, merchant: merchant)
      invoice      = create(:invoice, status: "shipped", merchant: merchant, customer: customer)
      invoice_item = create(:invoice_item, quantity: 5.00, unit_price: 9.00, item: item, invoice: invoice)
      transaction  = create(:transaction, credit_card_number: "4242424242424242",
                           result: "success", invoice: invoice)

      get :revenue, id: merchant.id, format: :json

      merchant_response = JSON.parse(response.body)
      binding.pry
      # expect(merchant_response['name']).to eq("Target")
      expect(merchant_response.merchant.revenue).to eq(45.00)
    end

    it "returns total_revenue by date for that merchant" do
      skip
    end

    it "returns the total revenue on date x across all merchants" do
      skip
    end
  end

  context "customers" do
    it "returns favorite customer for that merchant based on # of successful invoices" do
      skip
    end

    it "returns all customers with pending invoices for that merchant" do
      skip
    end
  end


end

