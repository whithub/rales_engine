class CustomerSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name
  root false


end
