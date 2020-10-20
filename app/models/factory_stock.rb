class FactoryStock < Stock
  default_scope { where(name: 'factory') }
end
