require "active_record/locking/fatalistic"

class Car < ActiveRecord::Base
  belongs_to :model
  belongs_to :stock, optional: true

  validates :year, presence: true

  enum status: %w[basic electronic final complete sold defected]

  scope :basic,      -> { where(status: :basic) }
  scope :electronic, -> { where(status: :electronic) }
  scope :final,      -> { where(status: :final) }
  scope :complete,   -> { where(status: :complete) }

  after_save :create_frame, if: :new_car

  #TODO rework in callback?
  def defective_car?
    [chassis, wheels, lasser, computer, engine, seat].include?(false)
  end

  def spot_defect
    part_of_car = %w[chassis wheels lasser computer engine seat]
    part_of_car.select { |part| part if self[part] == false }
  end

  private

  def new_car
    stock_id.nil?
  end

  def create_frame
    update(status: :basic, stock_id: FactoryStock.first.id)
  end
end
