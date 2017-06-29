class WorkClassifiedServicesController < ApplicationController 
  before_action :set_service, only: [:edit, :update, :destroy, :show]
  before_action :laboratories, only: [:edit, :new, :show]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]  
  before_action :set_sample_preliminary, only: [:values, :update]

  def index
    @services_unclassified_to_work = Service.unclassified_to_work current_user  
    @services_classified_to_rework = Service.service_classified_to_rework current_user  
  end

  def new    
  end

  def show
  end

  def values
    @rows = @sample_preliminary.quantity
    @cols = ["ph","diametro"]
    respond_to do |format|
      format.js
    end
  end

  def create
    @service.assign_attributes service_params
    if @service.valid?
      @service.set_work_flow(current_user)
      redirect_to work_classified_services_path
    else
      render :edit
    end
  end

  def edit
    @rows = 0
    @cols = []    
  end

  def update
    #cols = ["ph,"volumen"]
    #2 = @cols.length
    begin
      @service.update_obj(current_user, 2, params)
      if @service.errors.empty?
        redirect_to work_classified_services_path
      else
        render :edit
      end   
    rescue Exception => e
      redirect_to work_classified_services_path      
    end
  end



  private

    def service_params
      params.require(:service).permit(:laboratory_id, :user_id, :employee_id, :subject, :pick_up_date, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
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

    def sample_categories
      @sample_categories = SampleCategory.own_per_user current_user
    end

    def laboratories
      @laboratories = Laboratory.all
    end

    def set_sample_preliminary
      @sample_preliminary = SamplePreliminary.find params[:id]
    end
end
