class SuppliesController < ApplicationController
    before_action :set_supply, only: [:show, :edit, :update, :destroy, :toggle_status]
    before_action :laboratories, only: [:new, :create, :edit, :update, :show]
    before_action :set_controller

  def index
    @supplies = Supply.own_per_user(current_user)  
  end

  def new
    @supply = Supply.new
  end

  def show
  end

  def create
    @supply = Supply.new supply_params
    @supply.set_laboratory(current_user)  unless current_user.admin?    
    if @supply.save     
      redirect_to inventories_path
    else 
      render :new
    end  
  end

  def edit
  end

  def update
    @supply.assign_attributes supply_params
    if @supply.save
      redirect_to inventories_path
    else 
      render :edit
    end
  end

  def destroy
    @supply.destroy
    redirect_to inventories_path
  end

  def toggle_status
    @supply.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def supply_params
      params.require(:supply).permit(:laboratory_id, :code, :name, :description, :quantity, :measureUnit)
    end

    def set_supply
      @supply = Supply.find(params[:id])
    end

     def laboratories
      @laboratories = Laboratory.active
    end

    def set_controller
      @controller = "inventories"
    end
end
