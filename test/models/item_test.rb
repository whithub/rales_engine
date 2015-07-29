require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "can create an Item" do
    item = Item.new(name: "T-Shirt", description: "100% Cotton.", unit_price: 8, merchant_id: 1)
    assert item.valid?
  end

  test "an item is invalid without a name, description, price, or merchant_id" do
    item = Item.new
    assert item.invalid?
  end

  test "an item is invalid without a name" do
    item = Item.new(description: "100% Cotton.", unit_price: 8, merchant_id: 1)
    assert item.invalid?
  end

  test "an item is invalid without a description" do
    item = Item.new(name: "T-Shirt", unit_price: 8, merchant_id: 1)
    assert item.invalid?
  end

  test "an item is invalid without a unit_price" do
    item = Item.new(name: "T-Shirt", description: "100% Cotton.", merchant_id: 1)
    assert item.invalid?
  end

  test "an item is invalid without a merchant_id" do
    item = Item.new(name: "T-Shirt", description: "100% Cotton.", unit_price: 8)
    assert item.invalid?
  end

end
