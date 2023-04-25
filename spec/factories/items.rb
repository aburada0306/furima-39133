FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    content {Faker::Lorem.sentence}
    postage_id{Faker::Number.between(from: 2, to: 3)}
    category_id{Faker::Number.between(from: 2, to: 11)}
    status_id{Faker::Number.between(from: 2, to: 7)}
    prefecture_id{Faker::Number.between(from: 2, to: 48)}
    delivery_id{Faker::Number.between(from: 2, to: 4)}

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
