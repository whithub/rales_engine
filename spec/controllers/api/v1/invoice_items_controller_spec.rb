require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  context '#index' do
    it 'returns all invoice_items' do
      merchant       = create(:merchant, name: 'Chevy')
      customer       = create(:customer, first_name: 'Mick', last_name: "Jagger")
      item           = create(:item, name: 'car', description: 'hatchback', unit_price: 18000, merchant: merchant)
      invoice        = create(:invoice, status: 'shipped', customer: customer, merchant: merchant)
      invoice_item_1 = create(:invoice_item, quantity: 2, unit_price: 18000, item: item, invoice: invoice)
      invoice_item_2 = create(:invoice_item, quantity: 6, unit_price: 18000, item: item, invoice: invoice)

      get :index, format: :json
      expect(response).to have_http_status(:ok)

      invoice_items = JSON.parse(response.body)
      expect(invoice_items['invoice_items'].count).to eq(2)

      invoice_item = invoice_items['invoice_items'].last
      expect(invoice_item['quantity']).to eq(6)
    end
  end

  context '#show' do
    it 'returns a single invoice_item' do
      merchant     = create(:merchant, name: 'Chevy')
      customer     = create(:customer, first_name: 'Mick', last_name: "Jagger")
      item         = create(:item, name: 'car', description: 'hatchback', unit_price: 18000, merchant: merchant)
      invoice      = create(:invoice, status: 'shipped', customer: customer, merchant: merchant)
      invoice_item = create(:invoice_item, quantity: 2, unit_price: 18000, item: item, invoice: invoice)

      get :show, id: invoice.id, format: :json

      expect(response).to have_http_status(:ok)
      invoice_item = JSON.parse(response.body)

      expect(invoice_item['unit_price']).to eq(18000)
    end
  end

end


