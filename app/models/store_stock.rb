class StoreStock < Stock
  default_scope { where(kind: 'store_stock') }

  def available_cars_per_model(model:)
    Car.complete.joins(:model).where(models: { name: model} ).order(:id)
  end
end
