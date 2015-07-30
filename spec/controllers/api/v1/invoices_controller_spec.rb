require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  context '#index' do
    it 'returns all the invoices' do
      merchant    = create(:merchant, name: 'Target')
      customer    = create(:customer, first_name: 'Tom', last_name: 'Petty')
      invoice     = create(:invoice, status: 'shipped', customer: customer, merchant: merchant)
      transaction = create(:transaction, credit_card_number: '4242424242424242',
                           result: 'success', invoice: invoice)

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      invoices = JSON.parse(response.body)
      expect(invoices.count).to eq(1)

      invoice = invoices['invoices'].first
      expect(invoice['status']).to eq('shipped')
    end
  end

  context '#show' do
    it 'returns a single invoice' do
      merchant    = create(:merchant, name: 'Target')
      customer    = create(:customer, first_name: 'Tom', last_name: 'Petty')
      invoice     = create(:invoice, status: 'not shipped', customer: customer, merchant: merchant)
      transaction = create(:transaction, credit_card_number: '4242424242424242',
                           result: 'success', invoice: invoice)

      get :show, id: invoice.id, format: :json

      expect(response).to have_http_status(:ok)
      invoice = JSON.parse(response.body)

      expect(invoice['status']).to eq('not shipped')
    end
  end
end

