require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase

  test "can create an Invoice" do
    invoice = Invoice.new(merchant_id: 19, customer_id: 3, status: "shipped")
    assert invoice.valid?
  end

  test "an invoice is invalid without a merchant_id, customer_id, or status" do
    invoice = Invoice.new()
    assert invoice.invalid?
  end

  test "an invoice is invalid without a merchant_id" do
    invoice = Invoice.new(customer_id: 3, status: "shipped")
    assert invoice.invalid?
  end

  test "an invoice is invalid without a customer_id" do
    invoice = Invoice.new(merchant_id: 19, status: "shipped")
    assert invoice.invalid?
  end

  test "an invoice is invalid without a status" do
    invoice = Invoice.new(merchant_id: 19, customer_id: 3)
    assert invoice.invalid?
  end

end
