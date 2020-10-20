require 'rails_helper'

RSpec.describe NotificationRobot do
  let!(:stocks) do
    %w[factory_stock store_stock].each do |stock|
      Stock.create(name: stock, kind: stock.to_sym)
    end
  end

  let!(:car) { create(:car, :defected_car) }

  it 'calls slack notifcation' do
    expect(SlackNotificationWorker).to receive(:perform_async).with(String)
    described_class.call(car: car)
  end
end
