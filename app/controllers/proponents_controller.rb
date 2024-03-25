class ProponentsController < ApplicationController
  def index
    @proponents = Proponent.order(created_at: :desc).page(params[:page])
  end

  def new
    @proponent = Proponent.new
  end

  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
      redirect_to proponents_index_path, notice: "Proponent created successfully!"
    else
      render :new
    end
  end

  def destroy
    proponent = Proponent.find(params[:id])
    proponent.destroy
    redirect_to proponents_index_path
  end

  private

  def proponent_params
    params.require(:proponent).permit(:name, :cpf, :birthdate, :salary, :inss_discount)
  end
end
