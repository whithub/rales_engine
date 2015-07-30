class TransactionSerializer < ActiveModel::Serializer
  attributes :credit_card_number,
            :credit_card_expiration_date,
            :result,
            :invoice_id
  root false
end
