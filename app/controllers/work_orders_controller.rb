class WorkOrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy, :show]  
	
	def index
    @work_orders_to_work = WorkOrder.work_orders_to_work current_user
    @work_orders_to_rework = WorkOrder.work_orders_to_rework current_user
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
    begin
      @work_order.assign_attributes order_params
      if @work_order.valid?
        @work_order.handling_internal_process(current_user)
        redirect_to work_orders_path
      else
        render :edit
      end    
    rescue Exception => e
      redirect_to work_orders_path      
    end
  end

  private
    def order_params
      params.permit(:id,:sample_processed_id,:supervisor_id,:employee_id,:nr_revision,:report_id)
    end    

    def sample_processeds
      [:id, :sample_category_id, :description, :pucp_code, :client_code, sample_features_attributes: sample_features]
    end    

    def set_order
      @work_order = WorkOrder.find params[:id]
    end

end
