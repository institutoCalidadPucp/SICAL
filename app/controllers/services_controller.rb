class ServicesController < ApplicationController
  
  before_action :set_service, only: [:edit, :update, :destroy, :show]
  before_action :laboratories, only: [:edit, :new, :show]
  before_action :employees, only: [:edit, :new, :show]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]

  def index
    @services = Service.all
    @classified_services = Service.own_per_laboratory(current_user).classified
    @unattended = Service.own_per_user(current_user).initialized
  end

  def search
    @services = Service.where "created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]}   
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

  def update
    @service.assign_attributes service_params
    if @service.valid?
      @service.set_work_flow(current_user)
      redirect_to services_path
    else
      render :edit
    end
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
