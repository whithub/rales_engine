class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates :credit_card_number,          presence: true
  validates :result,                      presence: true
  validates :invoice_id,                  presence: true
end
