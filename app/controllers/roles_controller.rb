class RolesController < ApplicationController

  before_action :set_role, only: [:edit, :update, :destroy, :toggle_status, :show]
  before_action :menus, only: [:new, :edit, :create]
  before_action :laboratories, only: [:new, :edit, :show, :create, :update]

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
    if (@role.set_tab_reference).save
      @role.set_laboratory(current_user) unless current_user.admin?
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
      redirect_to roles_path
    else
      render :edit
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
      params.require(:role).permit(:name, :laboratory_id, :description, menu_permits_attributes: menu_permit_params).permit!
    end

    def menu_permit_params
      [:id, :name, :create_permit, :view_permit, :edit_permit, :delete_permit, :_destroy]
    end

    def set_role
      @role = Role.find params[:id]
    end

    def menus
      @menus = MenuPermit.names
    end

    def laboratories
      @laboratories = Laboratory.active
    end
end
