require 'rails_helper'

RSpec.describe Proponent, type: :model do
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

  it 'does not save a Proponent without a name' do
    proponent = Proponent.new(
      cpf: '123.456.789-00',
      birthdate: Date.new(1990, 10, 15),
      salary: 5000.00,
      inss_discount: 500.00
    )

    expect(proponent.save).to be_falsey
    expect(proponent.errors[:name]).to include("can't be blank")
  end
end
