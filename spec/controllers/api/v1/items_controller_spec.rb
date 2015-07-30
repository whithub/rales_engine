require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  context '#index' do
    it 'returns all the items' do
      merchant = create(:merchant, items: [build(:item, name: 'toy'), build(:item, name: 'whistle')])

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      items = JSON.parse(response.body)
      expect(items['items'].count).to eq(2)

      item = items['items'].last
      expect(item['name']).to eq('whistle')
    end
  end

  context '#show' do
    it 'returns a single item' do
      merchant = create(:merchant, items: [build(:item, name: 'toy'), build(:item, name: 'whistle')])

      get :show, id: merchant.items.last.id, format: :json

      expect(response).to have_http_status(:ok)
      item = JSON.parse(response.body)

      expect(item['name']).to eq('whistle')
    end
  end
end

