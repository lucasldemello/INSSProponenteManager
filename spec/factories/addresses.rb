FactoryBot.define do
  factory :address do
    proponent { nil }
    street { "MyString" }
    building_number { "MyString" }
    district { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { "MyString" }
  end
end
