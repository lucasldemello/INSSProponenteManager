# frozen_string_literal: true

FactoryBot.define do
  factory :proponent_phone do
    proponent { nil }
    phone_type { '1' }
    phone_number { 'MyString' }
    info { 'MyString' }
  end
end
