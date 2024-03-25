# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :proponent

  validates_presence_of :street, :building_number, :district, :city, :state, :zip_code
end
