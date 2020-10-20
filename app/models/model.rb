class Model < ApplicationRecord
  has_many :cars

  validates :name, :price, :cost, presence: true
end
