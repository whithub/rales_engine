class MerchantSerializer < ActiveModel::Serializer
  attributes :name

  root false
  has_many :items
end
