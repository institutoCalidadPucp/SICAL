class LaboratoriesController < ApplicationController

  before_action :set_laboratory, only: [:show, :edit, :update, :destroy]

  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def show
  end

  def create
    @laboratory = Laboratory.new laboratory_params
    if @laboratory.save
      redirect_to laboratories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @laboratory.assign_attributes laboratory_params
    if @laboratory.save
      redirect_to laboratories_path
    else
      render :edit
    end
  end

  def destroy
    if @laboratory.destroy
      redirect_to laboratories_path, notice: 'Laboratorio fue eliminado exitosamente'
    else
      redirect_to laboratories_path,  notice: 'Ocurrio un error'
    end
  end

  private
    def laboratory_params
      params.require(:laboratory).permit(:name, :phone, :email, :address, :description)
    end

    def set_laboratory
      @laboratory = Laboratory.find params[:id]
    end

end