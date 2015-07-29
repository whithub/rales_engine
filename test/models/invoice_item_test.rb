require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase

  test "can create an Invoice Item" do
    invoice_item = InvoiceItem.new(quantity: 5, unit_price: 2, item_id: 8, invoice_id: 10)
    assert invoice_item.valid?
  end

  test "an invoice item is invalid without a quantity, unit_price, item_id, or invoice_id" do
    invoice_item = InvoiceItem.new
    assert invoice_item.invalid?
  end

  test "an invoice item is invalid without a quantity" do
    invoice_item = InvoiceItem.new(unit_price: 2, item_id: 8, invoice_id: 10)
    assert invoice_item.invalid?
  end

  test "an invoice item is invalid without a unit price" do
    invoice_item = InvoiceItem.new(quantity: 5, item_id: 8, invoice_id: 10)
    assert invoice_item.invalid?
  end

  test "an invoice item is invalid without an item_id" do
    invoice_item = InvoiceItem.new(quantity: 5, unit_price: 2, invoice_id: 10)
    assert invoice_item.invalid?
  end

  test "an invoice item is invalid without an invoice_id" do
    invoice_item = InvoiceItem.new(quantity: 5, unit_price: 2, item_id: 8)
    assert invoice_item.invalid?
  end

end
