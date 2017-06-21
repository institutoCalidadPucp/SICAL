class WorkOrdersController < ApplicationController
	
	def index
    @work_orders = Service.work_order_per_user(current_user)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def set_service
      @service = Service.find params[:id]
    end
end
