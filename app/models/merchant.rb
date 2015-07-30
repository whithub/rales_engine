class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers,     through: :invoices
  has_many :transactions,  through: :invoices

  validates :name, presence: true

  def revenue(params)
    if params[:date]
      calc_revenue_by_date(DateTime.parse(params[:date]))
    else
      calc_revenue
    end
  end

  def calc_revenue
    invoices.total_revenue / 100.0
  end

  def calc_revenue_by_date(date)
    invoices.on_date(date).total_revenue / 100.0
  end

  def self.most_revenue(quantity)
    all.sort_by { |merchant| merchant.invoices.total_revenue }.last(quantity)
  end

  def fav_customer
    customers.max_by { |c| c.invoices.successful.where(merchant_id: id).count }
    # invoices.successful.select('invoices.customer_id').group(:customer_id).count.sort_by { |k, v| v }.reverse.first
  end

  def customers_with_pending_invoices
    pending_inv = invoices - invoices.successful
    pending_inv.map { |invoice| invoice.customer}
  end


end


