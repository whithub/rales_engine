class ItemSerializer < ActiveModel::Serializer
  root false
  attributes :name, :description, :unit_price
end
