desc 'Destroy not sold cars'
task robot_destroy_not_sold_cars: :environment do
  Car.lock do
    Car.where.not(status: :sold).destroy_all
  end
end
