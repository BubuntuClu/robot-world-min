Car.destroy_all
Model.destroy_all
Stock.destroy_all

%w[Honda BMW Audi RR Logan Lexus Ferrari Fiat Ford Nissan].each do |model_name|
  Model.create(name: model_name, price: rand(100...5000), cost: rand(100...5000))
end

%w[factory_stock store_stock].each do |stock|
  Stock.create(name: stock, kind: stock.to_sym)
end
