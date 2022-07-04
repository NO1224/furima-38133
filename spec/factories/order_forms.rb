FactoryBot.define do
  factory :order_form do
    post_code     {Faker::Number.decimal_part(digits: 3) + "-" + Faker::Number.decimal_part(digits: 4)}
    prefecture_id {Faker::Number.within(range: 2..48)}
    municipality  {Faker::Address.city}
    address       {Faker::Address.street_name}
    building_name {Faker::Address.building_number}
    phone_number  {Faker::Number.decimal_part(digits: 11)}
    token         {Faker::Internet.device_token}
  end
end