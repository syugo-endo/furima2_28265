FactoryBot.define do
  factory :item do
    user_id               {}
    category              {}
    condition             {}
    price                 {1111}
    name                  {}
    text                  {}
    shipping_date         {}
    shipping_fee          {1111}
    ship_from             {}
  end
end
