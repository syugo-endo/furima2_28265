FactoryBot.define do
  factory :buy_address do
    zip_code { '123-4567' }
    prefecture_id { 1 }
    city              { '横浜' }
    address1          { '横浜' }
    address2          { '横' }
    telephone         { 99_012_345_678 }
    association       :item
    association       :user
  end
end
