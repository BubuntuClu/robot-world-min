class Stock < ApplicationRecord
  has_many :cars

  enum kind: %i[factory_stock store_stock]
end
