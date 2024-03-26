# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:proponent) }
  end

  describe 'validations' do
    let!(:proponent) { create(:proponent) }
    subject { build(:address, proponent:) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:building_number) }
    it { should validate_presence_of(:district) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
  end

  it 'persists a new Address' do
    proponent = create(:proponent)
    address = Address.new(
      proponent:,
      street: Faker::Address.street_name,
      building_number: Faker::Address.building_number,
      district: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip_code: Faker::Address.zip_code
    )

    expect(address.save).to be_truthy
  end
end
