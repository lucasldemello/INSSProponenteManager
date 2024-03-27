require 'faker'
require_dependency 'inss_calc_service'

40.times do
  proponent = Proponent.new(
    name: Faker::Name.name,
    cpf: Faker::IdNumber.brazilian_citizen_number,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    salary: Faker::Number.decimal(l_digits: rand(3..4), r_digits: 2),
  )
  proponent.inss_discount = InssCalcService.new(proponent.salary).call

  proponent.address = Address.create(
    street: Faker::Address.street_name,
    building_number: Faker::Address.building_number,
    district: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code
  )

  3.times do
    proponent.proponent_phones.build(
      phone_type: ProponentPhone.phone_types.keys.sample,
      phone_number: Faker::PhoneNumber.phone_number,
      info: Faker::Lorem.sentence
    )
  end

  proponent.save!
end
