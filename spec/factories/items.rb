FactoryBot.define do
  factory :item do
    association :user
    category_id              { 3 }
    condition_id             { 3 }
    price                 { 1111 }
    name                  { 'は' }
    text                  { 'は' }
    shipping_date_id         { 3 }
    shipping_fee_id          { 1111 }
    prefecture_id { 3 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/files/test_image.jpeg')) }
  end
end
