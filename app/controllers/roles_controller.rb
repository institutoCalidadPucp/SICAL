class RolesController < ApplicationController

  before_action :set_role, only: [:edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def show

  end

  def create
    @role = Role.new role_params
    if @role.save
      redirect_to roles_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    @role.assign_attributes role_params
    if @role.save
      redirect_to roles_path, notice: 'Rol fue editado exitosamente'
    else 
      render :edit
    end
  end

  def destroy
    if @role.destroy
      redirect_to roles_path, notice: 'Rol fue eliminado exitosamente'
    else
      redirect_to roles_path, notice: 'Ocurrio un error'
    end  
  end

  private 
    def role_params
      params.require(:role).permit(:name, :description)
    end

    def set_role
      @role = Role.find params[:id]
    end
end
