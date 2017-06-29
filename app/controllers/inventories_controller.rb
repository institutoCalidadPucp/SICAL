class InventoriesController < ApplicationController

  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :laboratories, only: [:new, :create, :edit, :update, :show]

  def index
    @inventories = Inventory.own_per_user(current_user)
    @supplies = Supply.own_per_user(current_user)
  end

  def new
    @inventory = Inventory.new
  end

  def show
  end

  def create
    @inventory = Inventory.new inventory_params
    @inventory.set_laboratory(current_user)  unless current_user.admin?
    if @inventory.save     
      redirect_to inventories_path
    else 
      render :new
    end  
  end

  def edit
  end

  def update
    @inventory.assign_attributes inventory_params
    if @inventory.save
      redirect_to inventories_path
    else 
      render :edit
    end
  end

  def destroy
    @inventory.destroy
    redirect_to inventories_path
  end

  def toggle_status
    @inventory.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def inventory_params
      params.require(:inventory).permit(:laboratory_id, :code, :name, :brand, :product_model, :amount, :amount_unit, :description, :date_of_entry)
    end

    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def laboratories
      @laboratories = Laboratory.active
    end
end
