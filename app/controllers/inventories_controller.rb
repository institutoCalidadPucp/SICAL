class InventoriesController < ApplicationController

  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
  end

  def new
  end

  def create
    @inventory = Inventory.new inventory_params
    if @inventory.save
      redirect to inventories_path
    else 
      render new
    end
  end

  def edit
  end

  def update
  end

  def toggle_status
    @inventory.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def inventory_params
      params.require(:inventory).permit(:code, :name, :brand, :product_model, :float, :description, :date_of_entry)
    end

    def set_inventory
      @inventory = Laboratory.find params[:id]
    end
end
