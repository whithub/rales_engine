class ItemSerializer < ActiveModel::Serializer
  attributes :name, :description, :unit_price
  root false

end
