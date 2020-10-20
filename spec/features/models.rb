FactoryBot.define do
  factory :model do
    name { 'MyBrand' }
    cost { Random.rand(1.0...10.0).round(2) }
    price { Random.rand(1.0...10.0).round(2) }
  end
end
