class BuyerRobot
  def self.call(model_name:)
    car_for_sale = StoreStock.first.available_cars_per_model(model: model_name)

    ActiveRecord::Base.transaction do
      if car_for_sale.present?
        MakeOrder.call(car: car_for_sale)
      else
        MakeReport.call(model_name: model_name)
      end
    rescue
      NotificationRobot.error_notify(message: 'KARAMBA, BUYER IS BROKEN!')
    end
  end
end

