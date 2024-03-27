class ProponentsController < ApplicationController
  def index
    @proponents = Proponent.order(created_at: :desc).page(params[:page])
  end

  def new
    @proponent = Proponent.new
    @proponent.build_address
    @proponent.proponent_phones.build
  end

  def create
    create_params = proponent_params

    create_params[:salary] = create_params[:salary].gsub(/R\$|\./, '').sub(',', '.')[1..-1] if create_params[:salary].present?
    @proponent = Proponent.new(create_params)

    if @proponent.save
      redirect_to proponents_path, notice: "Proponent created successfully!"
    else
      render :new
    end
  end

  def show
    @proponent = Proponent.find(params[:id])
  end

  def edit
    @proponent = Proponent.find(params[:id])
  end

  def update
    @proponent = Proponent.find(params[:id])
    update_params = proponent_params
    debugger
    update_params[:salary] = update_params[:salary].gsub('R$', '').gsub('.', '').gsub(',', '.') if update_params[:salary].present? and update_params[:salary].include?('R$')

    if @proponent.update(update_params)
      redirect_to proponents_path, notice: "Proponent updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @proponent = Proponent.find(params[:id])
    @proponent.destroy
    redirect_to proponents_path, notice: 'Proponent was successfully deleted.'
  end

  def report
    @proponents_report = Proponent.proponents_by_salary_range
  end

  private

  def proponent_params
    params.require(:proponent).permit(
      :name, :cpf, :birthdate, :salary, :inss_discount,
      address_attributes: [:id, :street, :building_number, :district, :city, :state, :zip_code],
      proponent_phones_attributes: [:id, :phone_type, :phone_number, :info, :_destroy]
    )
  end
end
