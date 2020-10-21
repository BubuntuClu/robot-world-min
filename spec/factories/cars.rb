FactoryBot.define do
  factory :car do
    model
    stock
    year { Time.now.year }
    status { :basic }
  end

  trait :electronic_status do
    wheels { true }
    engine { true }
    chassis { true }
    status { :electronic }
  end

  trait :final_status do
    wheels { true }
    engine { true }
    chassis { true }
    lasser { true }
    computer { true }
    status { :final }
  end

  trait :complete_status do
    wheels { true }
    engine { true }
    chassis { true }
    lasser { true }
    computer { true }
    seat { true }
    status { :complete }
  end

  trait :defected_car do
    wheels { false }
    engine { true }
    chassis { false }
    lasser { true }
    computer { false }
    seat { true }
    status { :complete }
  end
end
