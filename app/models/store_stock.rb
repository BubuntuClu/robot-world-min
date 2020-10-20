class StoreStock < Stock
  default_scope { where(name: 'store') }
end
