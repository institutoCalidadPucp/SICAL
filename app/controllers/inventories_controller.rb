class InventoriesController < ApplicationController
  def create
    @inventory = Inventory.new inventory_params
    if @inventory.save
      redirect_to inventory_path
    else
      render :new
    end
  end
end
