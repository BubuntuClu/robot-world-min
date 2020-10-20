require 'rails_helper'

RSpec.describe BuyerRobot do
  let!(:stocks) do
    %w[factory_stock store_stock].each do |stock|
      Stock.create(name: stock, kind: stock.to_sym)
    end
  end

  let(:action) do
    described_class.call(model_name: model.name)
    described_class.call(model_name: model.name)
    described_class.call(model_name: model.name)
  end

  context 'amount of cars in store srock is enough' do
    let(:model) { create(:model)}
    let!(:cars) { create_list(:car, 4, :complete_status, model: model) }

    it 'makes orders' do
      expect { action }.to change(Order, :count).by(3)
    end

    it 'marks cars as sold' do
      action

      cars = Car.all

      expect(cars[0].status).to eq 'complete'
      expect(cars[1].status).to eq 'sold'
      expect(cars[2].status).to eq 'sold'
      expect(cars[3].status).to eq 'sold'
    end
  end

  context 'amount of cars in store srock is not enough' do
    let(:model) { create(:model)}
    let!(:car) { create(:car, :complete_status, model: model) }

    it 'makes orders' do
      expect { action }.to change(Order, :count).by(1)
    end

    it 'makes reports' do
      expect { action }.to change(Report, :count).by(2)
    end

    it 'marks cars as sold' do
      action

      cars = Car.all

      expect(cars[0].status).to eq 'sold'
    end
  end
end
