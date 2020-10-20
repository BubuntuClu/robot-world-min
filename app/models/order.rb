class Order < ApplicationRecord
  belongs_to :car
  belongs_to :model
end
