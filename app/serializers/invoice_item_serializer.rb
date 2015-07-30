class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :quantity, :unit_price, :item_id, :invoice_id
  root false

end
