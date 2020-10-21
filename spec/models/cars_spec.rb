require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it { should validate_presence_of :year }
  end

  describe 'associations' do
    it { should belong_to(:model) }
  end

  context 'methods' do
    let(:model) { create(:model) }
    let!(:stocks) do
      %w[factory_stock store_stock].each do |stock|
        Stock.create(name: stock, kind: stock.to_sym)
      end
    end

    context 'car without defects' do
      let(:car) { create(:car, :complete_status) }

      it 'has no defects' do
        expect(car.defective_car?).to be false
      end

      it 'dose not spot defects' do
        expect(car.spot_defect).to eq []
      end
    end

    context 'car with defects' do
      let(:car) { create(:car, :complete_status, seat: false) }

      it 'has defects' do
        expect(car.defective_car?).to be true
      end

      it 'spots defects' do
        expect(car.spot_defect).to eq ['seat']
      end
    end
  end
end
