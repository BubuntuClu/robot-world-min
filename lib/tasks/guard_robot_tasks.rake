desc 'Search cars with defects and marks them when spoted'
task robot_guard_search_defect: :environment do
  GuardRobot.search_for_defected_cars
end

desc 'Move complete cars without defect to store stock'
task robot_guard_move_cars: :environment do
  Car.lock do # prevent cars insert/update while we move them to store stock
    GuardRobot.search_for_defected_cars #just for sure that we dont miss new defected cars
    GuardRobot.move_cars_to_store
  end
end
