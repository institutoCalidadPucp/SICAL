class SampleMethodsController < ApplicationController
  before_action :set_sample_method, only: [:show, :edit, :update, :destroy]

  def index
    @sample_methods = SampleMethod.all
    p 'Llegue al index'
  end

  def new
    @sample_method = SampleMethod.new
  end

  def show
  end

  def create
    @sample_method = SampleMethod.new sample_method_params
    if @sample_method.save
      redirect_to sample_method_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @sample_method.assign_attributes sample_method_params
    if @sample_method.save
      redirect_to sample_method_path
    else
      render :edit
    end
  end

  def destroy
    if @sample_method.destroy
      redirect_to sample_method_path, notice: 'El Método de Muestra fue eliminado exitosamente'
    else
      redirect_to sample_method_path,  notice: 'Ocurrio un error. No se ha podido eliminar el método'
    end
  end

  private
    def sample_method_params
      params.require(:sample_method).permit(:description, :unitCost, :accreditation)
    end

    def set_sample_method
      @sample_method = SampleMethod.find params[:id]
    end

end
