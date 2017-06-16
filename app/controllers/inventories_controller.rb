class InventoriesController < ApplicationController

  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :laboratories, only: [:new, :create, :edit, :update, :show]

  def index
    begin
      @inventories = Inventory.own_per_user(current_user)
    rescue Exception => e
      true
    end
  end

  def new
    begin
      @inventory = Inventory.new
    rescue Exception => e
      render :index
    end
  end

  def show
    begin
      
    rescue Exception => e
      
    end
  end

  def create
    begin
      @inventory = Inventory.new inventory_params
      if @inventory.save
        @inventory.set_laboratory(current_user)  unless current_user.admin?
        redirect_to inventories_path
      else 
        render :new
      end  
    rescue Exception => e
      render :new
    end
  end

  def edit
    begin
      
    rescue Exception => e
      
    end
  end

  def update
    begin
      @inventory.assign_attributes inventory_params
      if @inventory.save
        redirect_to inventories_path
      else 
        render :edit
      end
    rescue Exception => e
      render :edit
    end
  end

  def destroy
    begin
      @inventory.destroy
      redirect_to inventories_path
    rescue Exception => e
      render :index
    end
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
      @laboratories = Laboratory.all
    end
end
