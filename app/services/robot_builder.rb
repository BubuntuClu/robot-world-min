class RobotBuilder
  def self.set_up_basic
    Car.basic.each do |car|
      #TODO add random with errors
      car.update(
        wheels: true,
        engine: true,
        chassis: true,
        status: :electronic
      )
    end
  end

  def self.set_up_electronic
    Car.electronic.each do |car|
      #TODO add random with errors
      car.update(
        lasser: true,
        computer: true,
        status: :final
      )
    end
  end

  def self.set_up_final
    Car.final.each do |car|
      #TODO add random with errors
      car.update(
        seat: true,
        status: :complete
      )
    end
  end
end

