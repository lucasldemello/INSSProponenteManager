# frozen_string_literal: true

# spec/services/inss_calc_service_spec.rb
require 'rails_helper'

RSpec.describe InssCalcService do
  describe '#calculate_inss' do
    context 'quando o salário está na primeira faixa' do
      it 'se for R$ 1000,00 o total a recolher deve ser R$ 75.00' do
        service = InssCalcService.new
        salary = 1000.00
        expect(service.calcular_inss(salary)).to eq(75.0)
      end
    end

    context 'quando o salário é de R$ 3000,00' do
      it 'O total a recolher deve ser R$ 281.62' do
        service = InssCalcService.new
        salary = 3000.00
        expect(service.calcular_inss(salary)).to eq(281.62)
      end
    end
  end
end
