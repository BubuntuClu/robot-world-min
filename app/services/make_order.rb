class MakeOrder
  def self.call(car:)
    ActiveRecord::Base.transaction do
      Order.create!(car: car, model: car.model)
      car.update!(status: :sold)
    rescue
      NotificationRobot.error_motify(message: "make order: transaction fail with car - #{car.id}")
    end
  end
end
