require 'rails_helper'

describe Merchant do
  describe "total revenue" do
    let(:merchant) { Merchant.create!(name: "Target") }

    before do
      # build up simple case
      customer = Customer.create!(first_name: "Jorge", last_name: "Novohispano")
      Invoices.create!(merchant_id: merchant, customer_id: customer.id, status: "success") # successful, in each do 1 invoice item
      Invoices.create!(merchant_id: merchant, customer_id: customer.id, status: "failed") # unsuccessful

    end

    xit 'calculates using only successful invoices' do
      expect(merchant.calc_revenue).to eql(20.0)
    end


    xit 'can return the invoices for a particular customer' do
      customer = Customer.create(valid_attrib)
      merchant = Merchant.create(name: "Justin Bieber",
        created_at: "2012-03-28 14:58:07 UTC",
        updated_at: "2012-03-28 14:58:07 UTC")
      invoice1 = Invoice.create( customer_id: customer.id,
        merchant_id: merchant.id,
        status: "shipped",
        created_at: "2012-03-28 14:58:07 UTC",
        updated_at: "2012-03-28 14:58:07 UTC" )
      invoice2 = Invoice.create( customer_id: customer.id,
        merchant_id: merchant.id,
        status: "shipped",
        created_at: "2012-03-29 14:58:07 UTC",
        updated_at: "2012-03-29 14:58:07 UTC" )

      expect(customer).to respond_to(:invoices)
      expect(customer.invoices.count).to eq(2)
    end

    xit 'can return the merchants for a particular customer' do
      skip
      customer = Customer.create(valid_attrib)
      merchant = Merchant.create(name: "Justin Bieber",
        created_at: "2012-03-28 14:58:07 UTC",
        updated_at: "2012-03-28 14:58:07 UTC")
      invoice1 = Invoice.create( customer_id: customer.id,
        merchant_id: merchant.id,
        status: "shipped",
        created_at: "2012-03-28 14:58:07 UTC",
        updated_at: "2012-03-28 14:58:07 UTC" )

      expect(customer).to respond_to(:merchants)
      expect(customer.merchants.count).to eq(1)

      invoice2 = Invoice.create( customer_id: customer.id,
        merchant_id: merchant.id,
        status: "shipped",
        created_at: "2012-03-29 14:58:07 UTC",
        updated_at: "2012-03-29 14:58:07 UTC" )

      expect(customer.merchants.count).to eq(1)
    end
  end
end
