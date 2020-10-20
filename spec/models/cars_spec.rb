require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:model) { create(:model) }

  describe 'validations' do
    it { should validate_presence_of :year }
  end

  describe 'associations' do
    it { should belong_to(:model) }
    it { should belong_to(:stock) }
  end
end
