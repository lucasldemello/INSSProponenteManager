# frozen_string_literal: true

class ProponentPhone < ApplicationRecord
  belongs_to :proponent

  validates_presence_of :phone_number

  enum phone_type: { cellphone: "0", landline_phone: "1", reference_phone: "2" }
end
