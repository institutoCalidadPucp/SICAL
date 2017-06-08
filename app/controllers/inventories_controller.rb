class InventoriesController < ApplicationController

  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def show
  end

  def create
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
    def set_inventory
      @inventory = Inventory.find params[:id]
    end
end
