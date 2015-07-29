require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test "it can find a single merchant" do
    merchant_1 = Merchant.create!(id: 1, name: "Target")
    merchant_2 = Merchant.create!(id: 2, name: "Bed, Bath, & Beyond")

    found_merch = Merchant.find_by(name: "Target")
    assert_equal Merchant, merchant_1.class
    refute_equal found_merch.name, "Bed, Bath, & Beyond"
  end

  test "it can find all merchants with a same attribute" do
    merchant_1 = Merchant.create!(id: 1, name: "Target")
    merchant_2 = Merchant.create!(id: 2, name: "Bed, Bath, & Beyond")
    merchant_3 = Merchant.create!(id: 3, name: "Target")

    multiple_merch = Merchant.where(name: "Target")
    assert_equal 2, multiple_merch.count
    assert_equal "Target", multiple_merch.first.name
    assert_equal "Target", multiple_merch.last.name
  end

  test "can find items a merchant sells" do
    merchant = Merchant.create!(id: 1, name: "Target")
    item_1 = Item.create!(name: "T-Shirt", description: "100% Cotton", unit_price: 11, merchant_id: merchant.id)
    item_2 = Item.create!(name: "Toy", description: "Stuffed Animal", unit_price: 9, merchant_id: merchant.id)

    assert_equal 2, merchant.items.size
    assert_equal Item, merchant.items[0].class
  end

  test "find invoices associated with this merchant" do
    merchant = Merchant.create!(id: 1, name: "Target")
    customer_1 = Customer.create!(id: 1, first_name: "Whitney", last_name: "Houston")
    customer_2 = Customer.create!(id: 2, first_name: "Tom", last_name: "Petty")
    invoice = Invoice.create!(status: "shipped", merchant_id: merchant.id, customer_id: customer_1.id)
    invoice = Invoice.create!(status: "shipped", merchant_id: merchant.id, customer_id: customer_2.id)

    assert_equal 2, merchant.invoices.size
    assert_equal Invoice, merchant.invoices[0].class
  end

  test "it can find total_revenue and revenue_by_date for a merchant" do
    merchant = Merchant.create!(id: 1, name: "Target")
    customer_1 = Customer.create!(id: 1, first_name: "Whitney", last_name: "Houston")
    customer_2 = Customer.create!(id: 2, first_name: "Tom", last_name: "Petty")

    item_1 = Item.create!(id: 1, name: "T-Shirt", description: "100% Cotton", unit_price: 11, merchant_id: merchant.id)
    item_2 = Item.create!(id: 2, name: "Toy", description: "Stuffed Animal", unit_price: 9, merchant_id: merchant.id)

    invoice_1 = Invoice.create!(id: 1, status: "shipped", merchant_id: merchant.id, customer_id: customer_1.id, created_at: '2015-08-01 14:55:53')
    invoice_2 = Invoice.create!(id: 2, status: "shipped", merchant_id: merchant.id, customer_id: customer_2.id, created_at: '2015-08-02 14:55:53')

    invoice_item_1 = InvoiceItem.create!(id: 1, quantity: 2, unit_price: 12, item_id: item_1.id, invoice_id: invoice_1.id, created_at: '2015-08-01 14:55:53')
    invoice_item_2 = InvoiceItem.create!(id: 2, quantity: 5, unit_price: 10, item_id: item_2.id, invoice_id: invoice_2.id, created_at: '2015-08-02 14:55:53')

    assert_equal 60, merchant.revenue('2015-08-02 14:55:53')

    assert_equal 84, merchant.calc_revenue

  end

  test "it can sort merchants by most revenue" do
    skip
  end

  test "it can sort merchants by most items sold" do
    skip
    merchant_1 = Merchant.create!(id: 1, name: "Target")
    merchant_2 = Merchant.create!(id: 1, name: "Bed, Bath, & Beyond")

    customer_1 = Customer.create!(id: 1, first_name: "Whitney", last_name: "Houston")
    customer_2 = Customer.create!(id: 2, first_name: "Tom", last_name: "Petty")

    item_1 = Item.create!(name: "T-Shirt", description: "100% Cotton", unit_price: 11, merchant_id: merchant_1.id)
    item_2 = Item.create!(name: "Toy", description: "Stuffed Animal", unit_price: 9, merchant_id: merchant_2.id)

    invoice_item_1 = InvoiceItem.create!(quantity: 2, unit_price: 12, item_id: item_1.id, invoice_id: invoice_1.id)
    invoice_item_2 = InvoiceItem.create!(quantity: 5, unit_price: 10, item_id: item_2.id, invoice_id: invoice_2.id)

    invoice_1 = Invoice.create!(status: "shipped", merchant_id: merchant_1.id, customer_id: customer_1.id, created_at: '2015-08-01')
    invoice_2 = Invoice.create!(status: "shipped", merchant_id: merchant_2.id, customer_id: customer_2.id, created_at: '2015-08-02')

    assert_equal 2, merchant_1.invoices.items.count
  end

  test "if finds a merchants favorite customer" do
    skip

    assert_equal Customer, customer.class
    assert_equal "Efren", customer.first_name
  end

  test "it can find customers_with_pending_invoices" do
    skip

    assert_equal 2, unpaid_customers.size
    assert_equal Customer, unpaid_customers[0].class
  end
end

