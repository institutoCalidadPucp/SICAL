class ServicesController < ApplicationController
  
  before_action :set_service, only: [:edit, :update, :destroy, :show]
  before_action :laboratories, only: [:edit, :new]

  def index
    @services = Service.all
    @attended = Service.own_per_user(current_user).prepared
    @unattended = Service.own_per_user(current_user).initialized
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
      params.require(:service).permit(:laboratory_id, :user_id, :subject, :pick_up_date, sample_preliminaries_attributes: [:name, :quantity, :description], sample_processeds_attributes: [:category, :description, :pucp_code, :client_code, sample_features_attributes: [:value, :description]])
    end

    def set_service
      @service = Service.find params[:id]
    end

    def laboratories
      @laboratories = Laboratory.all
    end

end
