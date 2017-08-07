class SampleMethodsController < ApplicationController
  before_action :set_sample_method, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :laboratories, only: [:show, :edit, :create, :new, :update]

  def index
    @sample_methods = SampleMethod.own_per_user(current_user)
  end

  def new
    @sample_method = SampleMethod.new
  end

  def show
  end

  def create
    @sample_method = SampleMethod.new sample_method_params.merge(:laboratory_id => current_user.laboratory.id) unless current_user.admin?
    @sample_method = SampleMethod.new sample_method_params unless current_user.employee?   
    if @sample_method.save
      current_user.register_audit "Creacion de metodo de muestra", "added", @sample_method.id, @sample_method.name, @sample_method.class.to_s
      redirect_to sample_methods_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @sample_method.assign_attributes sample_method_params
    if @sample_method.save
      current_user.register_audit "Actualizacion de informacion de metodo de muestra", "updated", @sample_method.id, @sample_method.name, @sample_method.class.to_s
      redirect_to sample_methods_path
    else
      render :edit
    end
  end

  def toggle_status
    @sample_method.change_status
    current_user.register_audit  @sample_method.tooltip_status +  " metodo de muestra", "updated", @sample_method.id, @sample_method.name, @sample_category.class.to_s
    respond_to do |format|
      format.js
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
      params.require(:sample_method).permit(:description, :unit_cost, :accreditation, :name, :laboratory_id)
    end

    def set_sample_method
      @sample_method = SampleMethod.find params[:id]
    end

    def laboratories
      @laboratories = Laboratory.all
    end

end
