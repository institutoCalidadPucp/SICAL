class InventoriesController < ApplicationController
  def new
    @inventory = Inventory.new
  end
end
