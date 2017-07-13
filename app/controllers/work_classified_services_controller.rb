class WorkClassifiedServicesController < ApplicationController 
  before_action :set_custody_order, only: [:edit, :update, :destroy, :show]
  before_action :laboratories, only: [:edit, :new, :show]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]  
<<<<<<< HEAD
  before_action :set_sample_methods, only: [:edit, :update]
=======
  before_action :set_sample_preliminary, only: [:values]
  before_action :set_custody_table, only: [:values,:edit,:update]
>>>>>>> 5705b4d6814da2fead15ec9b4187fddae47664d5

  def index
    @custody_orders_to_work = CustodyOrder.custody_orders_to_work current_user  
    @custody_orders_to_rework = CustodyOrder.custody_orders_to_rework current_user  
  end

  def new    
  end

  def show
  end

  def values    
    @lower_range = @features.pluck(:lower_range)
    @upper_range = @features.pluck(:upper_range)
    respond_to do |format|
      format.js
    end
  end

  def edit   
  end

  # Updating vs Creating
  def update  
    begin
      if @custody_order.to_work?      
        @service.create_obj(current_user, params,  @sample_preliminary, @custody_order)
      else       
        @sample_processed.update params, @sample_preliminary, @custody_order 
        @custody_order.supervisor_observation = params[:custody_order][:supervisor_observation]
      end      
      if @service.errors.empty?    
        @custody_order.handling_internal_process(current_user)     
        if @service.errors.empty?
          redirect_to work_classified_services_path
        end
      else
        render :edit
      end    
    rescue Exception => e             
      redirect_to work_classified_services_path            
    end
  end



  private

<<<<<<< HEAD
    def service_params
      params.require(:service).permit(:valid_classified,:laboratory_id, :user_id, :employee_id, :subject, :pick_up_date, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
    end
=======
    def order_params
      params.require(:custody_order).permit(:supervisor_id,:employee_id,:nr_revision,:sample_processed_id,:supervisor_observation,:valid_supervised)
    end    
>>>>>>> 5705b4d6814da2fead15ec9b4187fddae47664d5

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
      @sample_preliminary = @custody_order.sample_preliminary
      if @custody_order.to_rework?
        @sample_processed = @custody_order.sample_processed
      end
      @service = @sample_preliminary.service
    end

    def sample_categories
      @sample_categories = SampleCategory.own_per_user current_user
    end

    def laboratories
      @laboratories = Laboratory.all
    end

<<<<<<< HEAD
    def set_sample_methods
      @sample_methods = SampleMethod.all
=======
    def set_custody_table
      @rows = @sample_preliminary.quantity    
      @custody_order = CustodyOrder.where(sample_preliminary_id: @sample_preliminary.id) .first
      sample_id = @custody_order.sample_preliminary.sample_category_id
      method_id = @custody_order.sample_preliminary.sample_method_id
      cross_table = SampleCategoryxSampleMethod.where(sample_category_id: sample_id).where(sample_method_id: method_id).first
      @features = ChainFeature.where(sample_categoryx_sample_method_id: cross_table.id)
      @cols = @features.pluck(:concept)
    end

    def set_sample_preliminary
      @sample_preliminary = SamplePreliminary.find params[:id]     
>>>>>>> 5705b4d6814da2fead15ec9b4187fddae47664d5
    end
end
