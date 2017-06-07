class InventoriesController < ApplicationController

  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @inventory.assign_attributes inventory_params
    if @inventory.save
      redirect to inventories_path
    else 
      render: edit
    end
  end

  def toggle_status
    @inventory.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def set_inventory
      @inventory = Laboratory.find params[:id]
    end
end
