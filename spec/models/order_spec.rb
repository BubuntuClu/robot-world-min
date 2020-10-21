require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:car) }
    it { should belong_to(:model) }
  end
end
