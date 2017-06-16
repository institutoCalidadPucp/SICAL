class WorkOrdersController < ApplicationController
	
	def index
    begin
      @work_orders = Service.work_order_per_user(current_user)
    rescue Exception => e
      true
    end
  end

  def new
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def create
    begin
      
    rescue Exception => e
      render :new
    end
  end

  def show
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def edit
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def update
    begin
      
    rescue Exception => e
      render :edit
    end
  end

  private
    def set_service
      @service = Service.find params[:id]
    end
end
