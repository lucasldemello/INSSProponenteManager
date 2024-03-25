class Proponent < ApplicationRecord

  has_one :address

  validates :name, presence: true
  validates :cpf, presence: true
  validates :birthdate, presence: true
  validates :salary, presence: true
  validates :inss_discount, presence: true

end
