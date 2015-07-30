class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  validates :status,      presence: true
  validates :merchant_id, presence: true
  validates :customer_id, presence: true

  scope :total_revenue, -> {
    successful.joins(:invoice_items).sum('quantity * unit_price')
  }
  scope :on_date, -> (date) {
    where('invoices.created_at >= ? AND invoices.created_at < ?', date.beginning_of_day, date.end_of_day)
  }
  scope :successful, -> {
    joins(:transactions).where(transactions: {result: "success"})
  }
  # scope :pending, -> {
  #   joins(:transactions).where(transactions: {result: "failed"})
  # }


end
