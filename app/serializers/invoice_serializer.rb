class InvoiceSerializer < ActiveModel::Serializer
  attributes :status, :customer_id, :merchant_id
  root false

end
