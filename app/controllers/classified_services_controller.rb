class ClassifiedServicesController < ApplicationController

  before_action :set_service, only: [:edit,:update, :update, :destroy, :show]
  before_action :set_custody_order, only: [:work_check,:work_check_update, :destroy]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]	

	def index
		@services_unclassified = Service.inital_funded_accepted current_user	
    @custody_order_to_check = CustodyOrder.custody_orders_to_check current_user      
	end

  def work_check
  end

	def edit
     @employees = User.own_per_user(current_user).employee		
	end

	def update   
   begin         
      @service.asssign_workers_custody params, current_user
      #@service.set_work_flow current_user
      redirect_to  classified_services_path      
    rescue Exception => e      
      redirect_to classified_services_path      
    end
	end

  def work_check_update
    begin
      @custody_order.assign_attributes order_params
      if @custody_order.valid?
        @custody_order.handling_internal_process(current_user)
        left_orders = CustodyOrder.custody_orders_per_service(@service).where.not(work_flow: :completed)
        if !left_orders.any?
          @service.handling_internal_process(current_user)
        end
        if @custody_order.to_rework?
          @custody_order.increment!(:nr_revision)
        end
        redirect_to classified_services_path
      else
        render :work_check
      end
    rescue Exception => e      
      redirect_to classified_services_path
    end
  end

	private

    def service_params
      params.require(:service).permit(:valid_classified,:laboratory_id, :user_id, :employee_id, :subject, :pick_up_date, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
    end

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
        
    def set_service
      @service = Service.find params[:id]
      @custody_orders = CustodyOrder.where(service_id: params[:id])
    end

    def set_custody_order
      @custody_order = CustodyOrder.find params[:id]
      @service = @custody_order.sample_preliminary.service
    end

    def sample_categories
      @sample_categories = SampleCategory.own_per_user current_user
    end

    def laboratories
      @laboratories = Laboratory.all
    end

end
