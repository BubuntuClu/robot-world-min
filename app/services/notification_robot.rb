class NotificationRobot
  def self.call(car:)
    defects = car.spot_defect
    message = "Car - #{car.id}, has defects - #{defects.join(',')}"
    SlackNotificationWorker.perform_async(message)
  end
end
