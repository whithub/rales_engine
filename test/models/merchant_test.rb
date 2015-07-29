require 'test_helper'

class MerchantTest < ActiveSupport::TestCase

  test "can create a Merchant" do
    merchant = Merchant.new(name:"Target")
    assert merchant.valid?
  end

  test "a merchant is invalid without a name" do
    merchant = Merchant.new()
    assert merchant.invalid?
  end

end
