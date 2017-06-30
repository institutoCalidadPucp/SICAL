class WorkClassifiedServicesController < ApplicationController 
  before_action :set_custody_order, only: [:edit, :update, :destroy, :show]
  def index
    @custody_orders_to_work = CustodyOrder.custody_orders_to_work current_user  
    @custody_orders_to_rework = CustodyOrder.custody_orders_to_rework current_user  
  end

  def new    
  end

  def show
  end

  def create   
  end

  def edit    
  end

  def update
    begin
      if @custody_order.to_work?
        sample_preliminary = @custody_order.sample_preliminary
        sample_processed = SampleProcessed.create(pucp_code: params[:pucp_code],client_code: params[:client_code],custody_order_id: @custody_order.id,amount: sample_preliminary.quantity,service_id: sample_preliminary.service_id,sample_category_id: sample_preliminary.sample_category_id,sample_method_id: sample_preliminary.sample_method_id) 
        @custody_order.sample_processed_id = sample_processed.id
      else
        @custody_order.assign_attributes order_params
        # Modify the already create SampleProcessed
        end
      if @custody_order.valid?
        @custody_order.handling_internal_process(current_user)
        redirect_to work_classified_services_path
      else
        render :edit
      end    
    rescue Exception => e      
      p e.to_s
      redirect_to work_classified_services_path            
    end
  end


  private

    def order_params
      params.require(:custody_order).permit(:supervisor_id,:employee_id,:nr_revision,:sample_processed_id,:supervisor_observation,:valid_supervised)
    end    

    def sample_preliminaries
      [:id, :name, :quantity, :description]
    end

    def sample_processeds
      [:id, :sample_category_id, :description, :pucp_code, :client_code, sample_features_attributes: sample_features]
    end

    def sample_features
      [:id, :value, :description]
    end

    def set_custody_order
      @custody_order = CustodyOrder.find params[:id]
    end

    def sample_categories
      @sample_categories = SampleCategory.own_per_user current_user
    end

    def laboratories
      @laboratories = Laboratory.all
    end
end
