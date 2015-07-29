require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "can create a Transaction" do
    transaction = Transaction.new(invoice_id: 27, credit_card_number:"4242424242424242", result: "success")
    assert transaction.valid?
  end

  test "a transaction is invalid without an invoice_id, credit_card_num, or result" do
    transaction = Transaction.new()
    assert transaction.invalid?
  end

  test "a transaction is invalid without an invoice_id" do
    transaction = Transaction.new(credit_card_number: "4242424242424242", result: "failed")
    assert transaction.invalid?
  end

  test "a transaction is invalid without a credit_card_num" do
    transaction = Transaction.new(invoice_id: 27, result: "success")
    assert transaction.invalid?
  end

  test "a transaction is invalid without a result" do
    transaction = Transaction.new(invoice_id: 27, credit_card_number: "4242424242424242" )
    assert transaction.invalid?
  end

end
