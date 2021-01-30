FactoryBot.define do
  factory :room do
    address { Faker::Address.city }
    description { Faker::Address.street_address }
    fee { Faker::Number.decimal(l_digits: 2) }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    host_id { nil }
  end
end
