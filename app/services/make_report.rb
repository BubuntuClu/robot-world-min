class MakeReport
  def self.call(model_name:)
    ActiveRecord::Base.transaction do
      model = Model.find_by(name: model_name)
      Report.create!(model: model)
    rescue
      NotificationRobot.error_motify(message: "make report: transaction fail with model - #{model_name}")
    end
  end
end
