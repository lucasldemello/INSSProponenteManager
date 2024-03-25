# frozen_string_literal: true

class Proponent < ApplicationRecord
  has_one :address
  has_many :proponent_phones

  validates_presence_of :name, :cpf, :birthdate, :salary, :inss_discount
end
