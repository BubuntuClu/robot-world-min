FactoryBot.define do
  factory :car do
    model
    stock
    year { Time.now.year }
  end

  trait :electronic do
    wheels { true }
    engine { true }
    chassis { true }
    status { :electronic }
  end

  trait :final do
    lasser { true }
    computer { true }
    status { :final }
  end

  trait :complete do
    seat { true }
    status { :complete }
  end
end
