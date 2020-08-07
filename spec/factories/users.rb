FactoryBot.define do
  factory :user do
    nickname              { 'kakaka' }
    email                 { Faker::Internet.email }
    password              { 'kakaka3' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1999-10-10' }
  end
end
