class RolesController < ApplicationController

  before_action :set_role, only: [:edit, :update, :destroy, :toggle_status, :show]
  before_action :menus, only: [:new, :edit]

  def index
    @roles = Role.own_per_user(current_user)
  end

  def new
    @role = Role.new
  end

  def show
  end

  def create
    @role = Role.new role_params
    if (@role.set_tab_reference).save and @role.set_laboratory(current_user)
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
      if (@role.set_tab_reference).save and @role.set_laboratory(current_user)
        redirect_to roles_path, notice: 'Rol fue editado exitosamente'
      else 
        render :edit
      end
    rescue
      false
    end
  end

  def destroy
    @role.inactive!
    redirect_to roles_path
  end

  def toggle_status
    @role.change_status
    respond_to do |format|
      format.js
    end
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
