FactoryBot.define do
  factory :item do
    user_id               { 1 }
    category              { 3 }
    condition             { 3 }
    price                 { 1111 }
    name                  { 'は' }
    text                  { 'は' }
    shipping_date         { 3 }
    shipping_fee          { 1111 }
    ship_from             { 3 }
  end
end
