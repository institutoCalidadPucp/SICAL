class ServicesController < ApplicationController
  
  before_action :set_service, only: [:service_end,:service_end_update, :update, :destroy, :show]
  before_action :set_work_order, only: [:work_check,:work_check_update, :destroy]
  before_action :laboratories, only: [:edit, :new, :show]
  before_action :employees, only: [:edit, :new, :show]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]

  def index
    @services = Service.services_per_client current_user
    @unattended_services = Service.passed_classification current_user
    @unclassified_services = Service.inital_funded_accepted current_user    
    @work_orders_to_check = WorkOrder.work_orders_to_check current_user
    @completed_services = Service.services_completed current_user
  end

  def create    
    @service = Service.new service_params
    if @service.valid?
      @service.set_work_flow(current_user)
      redirect_to services_path
    else
      render :new
    end
  end

  def new 
    @service = Service.new
  end

  def show
  end

  def edit
  end

  def work_check     
  end

  def work_check_update 
    begin
      @work_order.valid_supervised = params[:work_order][:valid_supervised]
      if @work_order.valid?
        @work_order.handling_internal_process(current_user)
        left_orders = WorkOrder.work_orders_per_service(@service).where.not(work_flow: :completed)
        if !left_orders.any?
          @service.handling_internal_process(current_user)  
        end
        redirect_to services_path
      else
        render :work_check
      end    
    rescue Exception => e
      redirect_to services_path
    end
  end

  def service_end
  end

  def service_end_update
  end

  def update        
  end

  def destroy
    @laboratory.inactive!
    redirect_to laboratries_path
  end

  def toggle_status
    @laboratory.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def service_params
      params.require(:service).permit(:laboratory_id, :valid_classified, :user_id, :employee_id, :subject, :pick_up_date, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
    end

    def order_params
      params.permit(:id,:sample_processed_id,:supervisor_id,:employee_id,:nr_revision,:report_id)
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

    def set_service
      @service = Service.find params[:id]
    end

    def set_work_order      
      @work_order = WorkOrder.find params[:id]
      @service = @work_order.sample_processed.service
    end

    def laboratories
      @laboratories = Laboratory.all
    end

    def employees
      @employees = User.own_per_user(current_user)
    end

    def sample_categories
      @sample_categories = SampleCategory.own_per_user current_user
    end
end
