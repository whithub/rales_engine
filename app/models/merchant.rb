class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers,     through: :invoices
  has_many :transactions,  through: :invoices


  def revenue
    invoices.successful.joins(:invoice_items).sum('quantity * unit_price')
  end
  

  def fav_customer
    invoices.successful.select('invoices.customer_id').group(:customer_id).count.sort_by { |k, v| v }.reverse.first
  end

end

