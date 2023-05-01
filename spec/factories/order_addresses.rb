FactoryBot.define do
  factory :order_address do

    post_code  {"111-1111"} 
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city {Faker::Address.city}
    street{Faker::Address.street_address}
    building {Faker::Address.community }
    phone_number { Faker::Number.between(from: 9_999_999_999, to: 99_999_999_999) }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
