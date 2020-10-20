class StoreStock < Stock
  default_scope { where(kind: 'store_stock') }
end
