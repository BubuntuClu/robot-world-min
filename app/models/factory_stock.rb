class FactoryStock < Stock
  default_scope { where(kind: 'factory_stock') }
end
