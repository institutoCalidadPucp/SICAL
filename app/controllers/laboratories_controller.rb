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
    @laboratory = Laboratory.new(laboratory_params)

    if @laboratory.save
      redirect_to laboratories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @laboratory.update(laboratory_params)
      redirect_to laboratories_path
    else
      render :edit
    end
  end

  def destroy
    @laboratory.destroy
    redirect_to laboratories_path
  end

  private
    def laboratory_params
      params.require(:laboratory).permit(:nombre, :telefono, :email, :web, :direccion, :descripcion)
    end

    def set_laboratory
      @laboratory = Laboratory.find params[:id]
    end

end