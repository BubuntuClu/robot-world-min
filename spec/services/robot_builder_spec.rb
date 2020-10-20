require 'rails_helper'

RSpec.describe RobotBuilder do
  let(:model) { create(:model) }

  let!(:stocks) do
    %w[factory_stock store_stock].each do |stock|
      Stock.create(name: stock, kind: stock.to_sym)
    end
  end

  context '#set_up_basic' do
    it 'sets up basic constractions' do
      car = Car.create(
        model_id: model.id,
        year: Time.now.year,
      )

      described_class.set_up_basic
      car.reload

      expect(car.wheels).to eq true
      expect(car.engine).to eq true
      expect(car.chassis).to eq true
    end

    it 'changes status to electronic' do
      car = Car.create(
        model_id: model.id,
        year: Time.now.year,
      )

      described_class.set_up_basic
      car.reload

      expect(car.status).to eq 'electronic'
    end
  end

  context '#set_up_electronic' do
    let!(:car) { create(:car, :electronic) }
    it 'sets up electronic constractions' do

      described_class.set_up_electronic
      car.reload

      expect(car.lasser).to eq true
      expect(car.computer).to eq true
    end

    it 'changes status to final' do
      described_class.set_up_electronic
      car.reload

      expect(car.status).to eq 'final'
    end
  end

  context '#set_up_electronic' do
    let!(:car) { create(:car, :final) }

    it 'sets up final constractions' do

      described_class.set_up_final
      car.reload

      expect(car.seat).to eq true
    end

    it 'changes status to final' do
      described_class.set_up_final
      car.reload

      expect(car.status).to eq 'complete'
    end
  end
end
