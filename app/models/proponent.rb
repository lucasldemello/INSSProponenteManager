# frozen_string_literal: true

class Proponent < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :proponent_phones, dependent: :destroy

  validates_presence_of :name, :cpf, :birthdate, :salary, :inss_discount

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :proponent_phones, allow_destroy: true

  def self.proponents_by_salary_range
    select(
      "CASE
         WHEN salary <= 1045 THEN 'Até R$ 1.045,00'
         WHEN salary BETWEEN 1046 AND 2089.60 THEN 'De R$ 1.045,01 a R$ 2.089,60'
         WHEN salary BETWEEN 2089.61 AND 3134.40 THEN 'De R$ 2.089,61 até R$ 3.134,40'
         WHEN salary BETWEEN 3134.41 AND 6101.06 THEN 'De R$ 3.134,41 até R$ 6.101,06'
         ELSE 'Superior a R$ 6.101,06'
       END AS salary_range, COUNT(*) AS count"
    ).group("salary_range").order("salary_range")
  end
end
