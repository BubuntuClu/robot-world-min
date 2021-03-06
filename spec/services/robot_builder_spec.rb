require 'rails_helper'

RSpec.describe RobotBuilder do
  let(:model) { create(:model) }

  let!(:stocks) do
    %w[factory_stock store_stock].each do |stock|
      Stock.create(name: stock, kind: stock.to_sym)
    end
  end

  context '#create_model_car' do
    it 'creates car' do
      expect { described_class.create_model_car(model: model) }.to change(Car, :count).by(1)
    end

    it 'sets status to basic' do
      described_class.create_model_car(model: model)
      car = Car.last

      expect(car.status).to eq 'basic'
    end

    it 'places car to factory stock' do
      described_class.create_model_car(model: model)
      car = Car.last

      expect(car.stock.id).to eq FactoryStock.first.id
    end
  end

  describe 'high success rate' do
    let(:robot_builder) { RobotBuilder.new(success_rate: 100) }

    context '#set_up_basic' do
      let!(:car) { create(:car) }

      it 'sets up basic constractions' do
        robot_builder.set_up_basic
        car.reload

        expect(car.wheels).to eq true
        expect(car.engine).to eq true
        expect(car.chassis).to eq true
      end

      it 'changes status to electronic' do
        robot_builder.set_up_basic
        car.reload

        expect(car.status).to eq 'electronic'
      end
    end

    context '#set_up_electronic' do
      let!(:car) { create(:car, :electronic) }
      it 'sets up electronic constractions' do

        robot_builder.set_up_electronic
        car.reload

        expect(car.lasser).to eq true
        expect(car.computer).to eq true
      end

      it 'changes status to final' do
        robot_builder.set_up_electronic
        car.reload

        expect(car.status).to eq 'final'
      end
    end

    context '#set_up_electronic' do
      let!(:car) { create(:car, :final) }

      it 'sets up final constractions' do

        robot_builder.set_up_final
        car.reload

        expect(car.seat).to eq true
      end

      it 'changes status to final' do
        robot_builder.set_up_final
        car.reload

        expect(car.status).to eq 'complete'
      end
    end
  end

  describe 'low success rate' do
    let(:robot_builder) { RobotBuilder.new(success_rate: 0) }
    context '#set_up_basic' do
      let!(:car) { create(:car) }

      it 'sets up basic constractions' do
        robot_builder.set_up_basic
        car.reload

        expect(car.wheels).to eq false
        expect(car.engine).to eq false
        expect(car.chassis).to eq false
      end

      it 'changes status to electronic' do
        robot_builder.set_up_basic
        car.reload

        expect(car.status).to eq 'electronic'
      end
    end

    context '#set_up_electronic' do
      let!(:car) { create(:car, :electronic) }
      it 'sets up electronic constractions' do

        robot_builder.set_up_electronic
        car.reload

        expect(car.lasser).to eq false
        expect(car.computer).to eq false
      end

      it 'changes status to final' do
        robot_builder.set_up_electronic
        car.reload

        expect(car.status).to eq 'final'
      end
    end

    context '#set_up_electronic' do
      let!(:car) { create(:car, :final) }

      it 'sets up final constractions' do

        robot_builder.set_up_final
        car.reload

        expect(car.seat).to eq false
      end

      it 'changes status to final' do
        robot_builder.set_up_final
        car.reload

        expect(car.status).to eq 'complete'
      end
    end
  end
end
