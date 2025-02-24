class InssDiscountController < ApplicationController
  def calculate
    salary = params[:salary].to_f

    return render json: { error: 'Salário inválido' }, status: :bad_request if salary <= 0.0
    return render json: { error: 'Salário acima do permitido' }, status: :bad_request if salary > 1_000_000.0

    result = InssCalcService.new(salary).call

    render json: { inss_discount: result }, status: :ok
  end
end
