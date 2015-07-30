require 'rails_helper'

describe "TransactionController" do
  context '#index' do
    it 'returns all the transactions' do
      merchant    = create(name: 'Target')
      customer    = create(first_name: 'Tom', last_name: 'Petty')
      invoice     = create(status: 'shipped', customer: customer, merchant: merchant)
      transaction = create(credit_card_number: '4242424242424242',
                            result: 'success', invoice: invoice)

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      transactions = JSON.parse(response.body)
      expect(transactions.count).to eq(1)

      transaction = transactions.first
      expect(transaction['result']).to eq('success')
    end
  end

  context '#show' do
    it 'returns a single transaction' do
      merchant    = create(name: 'Target')
      customer    = create(first_name: 'Tom', last_name: 'Petty')
      invoice     = create(status: 'shipped', customer: customer, merchant: merchant)
      transaction = create(credit_card_number: '4242424242424242',
                            result: 'success', invoice: invoice)

      get :show, id: transaction.id, format: :json

      expect(response).to have_http_status(:ok)
      transaction = JSON.parse(response.body)

      expect(transaction['result']).to eq('success')
      expect(transaction['credit_card_number']).to eq('4242424242424242')
    end
  end
end

