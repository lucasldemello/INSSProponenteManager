require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:proponent) }
  end

  it 'persists a new Address' do
    proponent = create(:proponent)
    address = Address.new(
      proponent: proponent,
      street: Faker::Address.street_name,
      building_number: Faker::Address.building_number,
      district: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip_code: Faker::Address.zip_code
    )

    expect(address.save).to be_truthy
  end

  it 'does not save an Address without required fields' do
    address = Address.new()

    expect(address.save).to be_falsey
    expect(address.errors[:proponent]).to include("must exist")
    expect(address.errors[:street]).to include("can't be blank")
    expect(address.errors[:building_number]).to include("can't be blank")
    expect(address.errors[:district]).to include("can't be blank")
    expect(address.errors[:city]).to include("can't be blank")
    expect(address.errors[:state]).to include("can't be blank")
  end
end
