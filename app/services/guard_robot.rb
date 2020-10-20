class GuardRobot
  def self.search_for_defected_cars
    Car.complete.find_each do |car|
      if car.defective_car?
        car.update(status: :defected)

        NotificationRobot.call(car: car)
      end
    end
  end

  def self.move_cars_to_store
    Car.complete.update_all(stock_id: StoreStock.first.id)
  end
end
