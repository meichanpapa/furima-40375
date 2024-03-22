FactoryBot.define do
  factory :order_shipping_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { '前橋市' }
    house_number  { '1-1' }
    building_name { '前橋ハイツ' }
    phone_number  { '09012345678' }
  end
end
