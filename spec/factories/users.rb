FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    username { Faker::Name.unique.name.split.join('')[0...10] }
  end
end
