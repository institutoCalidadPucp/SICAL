class WorkOrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy, :show]  
  before_action :set_custody_table, only: [:edit]
	
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
      params.require(:work_order).permit(:supervisor_id,:employee_id,:nr_revision,:internal_report,:report_name)
    end    

    def sample_processeds
      [:id, :sample_category_id, :description, :pucp_code, :client_code, sample_features_attributes: sample_features]
    end    

    def set_order
      @work_order = WorkOrder.find params[:id]
      @sample_processed = @work_order.sample_processed
    end


    def set_custody_table
      @rows = @sample_processed.amount        
      sample_id = @sample_processed.sample_category_id
      method_id = @sample_processed.sample_method_id
      cross_table = SampleCategoryxSampleMethod.where(sample_category_id: sample_id).where(sample_method_id: method_id).first
      @features = ChainFeature.where(sample_categoryx_sample_method_id: cross_table.id)
      @cols = @features.pluck(:concept)
    end

end
