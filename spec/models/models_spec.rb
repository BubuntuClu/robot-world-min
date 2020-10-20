require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
    it { should validate_presence_of :price }
  end

  describe 'associations' do
    it { should have_many(:cars) }
  end
end
