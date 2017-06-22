class WorkOrdersController < ApplicationController
  before_action :set_service, only: [:edit, :update, :destroy, :show]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]
	
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
    @service.assign_attributes service_params
    if @service.valid?
      @service.set_work_flow(current_user)
      redirect_to services_path
    else
      render :edit
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
end
