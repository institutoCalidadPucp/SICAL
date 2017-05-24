class LaboratoriesController < ApplicationController

  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def show
    @laboratory = Laboratory.find(get_id)
  end

  def create
    @laboratory = Laboratory.new(get_params)

    if @laboratory.save
      redirect_to laboratories_path
    else
      render 'new'
    end
  end

  def edit
    @laboratory = Laboratory.find(get_id)
  end

  def update
    @laboratory = Laboratory.find(get_id)

    if @laboratory.update(get_params)
      redirect_to laboratories_path
    else
      render 'edit'
    end
  end

  def destroy
    @laboratory = Laboratory.find(get_id)
    @laboratory.destroy

    redirect_to laboratories_path
  end

  private
    def get_params
      params.require(:laboratory).permit(:nombre, :telefono, :email, :web, :direccion, :descripcion)
    end

    def get_id
      params[:id]
    end

end