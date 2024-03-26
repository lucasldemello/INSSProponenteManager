# spec/controllers/inss_discount_controller_spec.rb
require 'rails_helper'

RSpec.describe InssDiscountController, type: :controller do
  describe 'POST #calculate' do
    context 'when the salary is valid' do
      let(:valid_salary) { 3000.0 }

      before do
        allow_any_instance_of(InssCalcService).to receive(:call).and_return('12345')
        post :calculate, params: { salary: valid_salary }
      end

      it 'returns a success status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the job_id in JSON response' do
        expect(JSON.parse(response.body)).to eq({ 'inss_discount' => '12345' })
      end
    end

    context 'when the salary is invalid (<= 0)' do
      let(:invalid_salary) { 0.0 }

      before do
        post :calculate, params: { salary: invalid_salary }
      end

      it 'returns a bad request status' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns an error message in JSON response' do
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Salário inválido' })
      end
    end

    context 'when the salary is above the permitted limit' do
      let(:high_salary) { 1500000.0 }

      before do
        post :calculate, params: { salary: high_salary }
      end

      it 'returns a bad request status' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns an error message in JSON response' do
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Salário acima do permitido' })
      end
    end
  end
end
