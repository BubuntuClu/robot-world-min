require 'rails_helper'

RSpec.describe StoreStock, type: :model do
  context 'methods' do
    let(:model) { create(:model) }
    let!(:stocks) do
      %w[factory_stock store_stock].each do |stock|
        Stock.create(name: stock, kind: stock.to_sym)
      end
    end

    let(:store) { StoreStock.first }

    context 'car in the store stock' do
      let!(:complete_car) { create(:car, :complete_status, model: model) }

      it 'has no defects' do
        car = store.available_cars_per_model(model: model.name)
        expect(car.present?).to be true
      end
    end

    context 'car not in the store stock' do

      it 'has no defects' do
        car = store.available_cars_per_model(model: model.name)
        expect(car.present?).to be false
      end
    end
  end
end
