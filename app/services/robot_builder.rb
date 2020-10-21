class RobotBuilder
  def self.create_model_car(model:)
    Car.create(
      model_id: model.id,
      year: Time.now.year,
    )
  end

  def initialize(success_rate:)
    @success_rate = success_rate
  end

  def set_up_basic
    Car.basic.each do |car|
      car.update(
        wheels: operation_successfull?,
        engine: operation_successfull?,
        chassis: operation_successfull?,
        status: :electronic
      )
    end
  end

  def set_up_electronic
    Car.electronic.each do |car|
      car.update(
        lasser: operation_successfull?,
        computer: operation_successfull?,
        status: :final
      )
    end
  end

  def set_up_final
    Car.final.each do |car|
      car.update(
        seat: operation_successfull?,
        status: :complete
      )
    end
  end

  private

  def operation_successfull?
    (rand(1...100) + @success_rate) / 100
  end
end
