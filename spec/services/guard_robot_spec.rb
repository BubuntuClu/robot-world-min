require 'rails_helper'

RSpec.describe GuardRobot do
  let!(:stocks) do
    %w[factory_stock store_stock].each do |stock|
      Stock.create(name: stock, kind: stock.to_sym)
    end
  end
  context 'car without defects' do
    let!(:cars) { create_list(:car, 3, :complete_status, stock: FactoryStock.first) }

    it 'does not call slack notifcation' do
      expect(NotificationRobot).to_not receive(:defect_notify).with(car: Car)
      described_class.search_for_defected_cars
    end

    it 'moves complete cars to store stock' do
      described_class.move_cars_to_store
      expect(Car.all.pluck(:stock_id).uniq).to eq [StoreStock.first.id]
    end
  end

  context 'car with defects' do
    let!(:cars) { create_list(:car, 3, :defected_car, stock: FactoryStock.first) }

    it 'does not call slack notifcation' do
      expect(NotificationRobot).to receive(:defect_notify).with(car: Car).exactly(3).times
      described_class.search_for_defected_cars
    end

    it 'keeps defected cars in factory stock' do
      described_class.search_for_defected_cars
      described_class.move_cars_to_store

      expect(Car.all.pluck(:stock_id).uniq).to eq [FactoryStock.first.id]
      expect(Car.last.status).to eq 'defected'
    end
  end
end
