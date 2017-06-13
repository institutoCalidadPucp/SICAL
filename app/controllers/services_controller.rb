class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :update, :destroy, :show]

  def index
    @services = Service.all
  end

  def create
    @service = Service.new service_params
    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  def new 
    @service = Service.new
    @laboratories = Laboratory.all
  end

  def show
  end

  def edit
    @laboratories = Laboratory.all
  end

  def update
    @service.assign_attributes service_params
    if @service.save
      redirect_to services_path
    else
      render :edit
    end
  end

  private
    def service_params
      params.require(:service).permit(:laboratory_id, :user_id, :subject, :pick_up_date, sample_preliminaries_attributes: [:name, :quantity, :description], sample_processeds_attributes: [:category, :description, :pucp_code, :client_code, sample_features_attributes: [:value, :description]])
    end

    def set_service
      @service = Service.find params[:id]
    end

end
