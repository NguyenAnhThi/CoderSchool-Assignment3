FactoryGirl.define do
  factory :ticket_order do
    quantity 1
    name "MyString"
    email "MyString"
    phone "MyString"
    address "MyString"
    total_price "9.99"
    ticket_type nil
  end
end
