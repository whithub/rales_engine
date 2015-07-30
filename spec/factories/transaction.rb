FactoryGirl.define do
  factory :transaction do
    credit_card_number "4242424242424242"
    credit_card_expiration_date "2015-08-01"
    result "success"
    invoice
  end
end
