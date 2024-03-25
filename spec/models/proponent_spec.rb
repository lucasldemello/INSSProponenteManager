require 'rails_helper'

RSpec.describe Proponent, type: :model do

describe 'associations' do
    it { should have_one(:address) }
  end

  it 'persists a new Proponent' do
    proponent = Proponent.new(
      name: 'John Doe',
      cpf: '123.456.789-00',
      birthdate: Date.new(1990, 10, 15),
      salary: 5000.00,
      inss_discount: 500.00
    )

    expect(proponent.save).to be_truthy
  end

  it 'does not save a Proponent without required fields' do
    proponent = Proponent.new()

    expect(proponent.save).to be_falsey
    expect(proponent.errors[:name]).to include("can't be blank")
    expect(proponent.errors[:cpf]).to include("can't be blank")
    expect(proponent.errors[:birthdate]).to include("can't be blank")
  end
end
