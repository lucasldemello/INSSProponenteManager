class Address < ApplicationRecord
  belongs_to :proponent

  validates :street, presence: true
  validates :building_number, presence: true
  validates :district, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

end
