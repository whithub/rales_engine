class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers,     through: :invoices
  has_many :transactions,  through: :invoices


  def revenue
    Merchant.invoice_item.reduce(0) do |sum, inv_item|
      (sum + (inv_item.unit_price / 100.00) * inv_item.quantity)
    end
  end
end
