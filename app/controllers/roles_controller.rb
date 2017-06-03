class RolesController < ApplicationController

  before_action :set_role, only: [:edit, :update, :destroy]
  before_action :menus, only: [:new, :edit]

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new role_params
    if (@role.set_tab_reference).save
      redirect_to roles_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    begin
      @role.destroy
      @role = Role.new role_params
      if (@role.set_tab_reference).save
        redirect_to roles_path, notice: 'Rol fue editado exitosamente'
      else 
        render :edit
      end
    rescue
      p '********************* OK ******************'
    end
  end

  def destroy
    @role.inactive!
    redirect_to roles_path
  end

  private 
    def role_params
      params.require(:role).permit(:name, :description, menu_permits_attributes: [:name, :create_permit, :view_permit, :edit_permit, :delete_permit])
    end

    def set_role
      @role = Role.find params[:id]
    end

    def menus
      @menus = MenuPermit.names
    end
end
