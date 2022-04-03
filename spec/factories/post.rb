FactoryBot.define do
  factory :post do
    body { Faker::Lorem.characters(number:30) }
  end
end