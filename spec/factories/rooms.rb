FactoryBot.define do
  factory :room do
    adress { Faker::Adress.city }
    description { Faker::Address.street_address }
    fee { Faker::Number.decimal(l_digits: 2) }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user_id { Faker::Number.unique.number(digits: 10) }
  end
end
