# frozen_string_literal: true

class InssCalcService
  def calculate_inss(salary)
    bands = [
      { lower_limit: 0, upper_limit: 1045, rate: 0.075 },
      { lower_limit: 1045.01, upper_limit: 2089.60, rate: 0.09 },
      { lower_limit: 2089.61, upper_limit: 3134.40, rate: 0.12 },
      { lower_limit: 3134.41, upper_limit: 6101.06, rate: 0.14 }
    ]

    total_inss = 0
    bands.each do |band|
      next unless salary > band[:lower_limit]

      upper_limit_band = [salary, band[:upper_limit]].min
      band_value = upper_limit_band - band[:lower_limit]
      total_inss += (band_value * band[:rate]).truncate(2) # se considerar mais que duas casas dá uma diferença de 0.01
    end

    total_inss
  end
end
