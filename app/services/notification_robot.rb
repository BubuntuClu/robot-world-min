class NotificationRobot
  def self.defect_notify(car:)
    defects = car.spot_defect
    message = "Car - #{car.id}, has defects - #{defects.join(',')}"
    SlackNotificationWorker.perform_async(message)
  end

  def self.error_notify(message:)
    SlackNotificationWorker.perform_async(message)
  end
end
