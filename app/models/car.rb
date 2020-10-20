class Car < ApplicationRecord
  belongs_to :model
  belongs_to :stock

  validates :year, presence: true

  enum status: %w[Basic Electronic Painting Complete Sold]
end
