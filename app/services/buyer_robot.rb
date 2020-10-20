class BuyerRobot
  def self.call(amount:, model_name:)
    available_cars = StoreStock.first.available_cars_per_model(model: model_name)

    ActiveRecord::Base.transaction do
      amount.times do |index|
        car_for_sale = available_cars[index]

        if car_for_sale.present?
          MakeOrder.call(car: car_for_sale)
        else
          MakeReport.call(model_name: model_name)
        end
      end
    rescue
      NotificationRobot.error_notify(message: 'KARAMBA, BUYER IS BROKEN!')
    end
  end
end

