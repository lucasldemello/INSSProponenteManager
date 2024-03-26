# spec/services/inss_calc_service_spec.rb
require 'rails_helper'

RSpec.describe InssCalcService do
  subject(:inss_calc_service) { described_class.new(salary) }

  let(:salary) { 1000.0 }

  describe '#call' do
    context 'when the salary is within the first band' do
      it 'calculates the INSS correctly' do
        expect(inss_calc_service.call).to eq(75)
      end
    end

    context 'when the salary is R$ 3000' do
      let(:salary) { 3000.0 }

      it 'calculates the INSS correctly' do
        expect(inss_calc_service.call).to eq(281.62)
      end
    end
  end
end
