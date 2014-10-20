# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    customer_id ""
    transaction_id ""
    invoice_id "MyString"
  end
end
