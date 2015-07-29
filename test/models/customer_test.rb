require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "can create a Customer" do
    customer = Customer.new(first_name: "Jorge", last_name: "Novohispano")
    assert customer.valid?
  end

  test "customer is invalid without a first or last name" do
    customer = Customer.new()
    assert customer.invalid?
  end

  test "customer is invalid without a first name" do
    customer = Customer.new(last_name: "Novohispano")
    assert customer.invalid?
  end

  test "customer is invalid without a last name" do
    customer = Customer.new(first_name: "Jorge")
    assert customer.invalid?
  end

end
