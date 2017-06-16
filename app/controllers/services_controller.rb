class ServicesController < ApplicationController
  
  before_action :set_service, only: [:edit, :update, :destroy, :show]
  before_action :laboratories, only: [:edit, :new]

  def index
    begin
      @services = Service.all
      @attended = Service.own_per_user(current_user).prepared
      @unattended = Service.own_per_user(current_user).initialized
    rescue Exception => e
      true
    end
  end

  def create
    begin
      @service = Service.new service_params
      if @service.valid?
        @service.set_work_flow(current_user)
        redirect_to services_path
      else
        render :new
      end
    rescue Exception => e
      render :new
    end
  end

  def new
    begin
      @service = Service.new
    rescue Exception => e
      render :index
    end 
  end

  def show
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def edit
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def update
    begin
      @service.assign_attributes service_params
      if @service.valid?
        @service.set_work_flow(current_user)
        redirect_to services_path
      else
        render :edit
      end
    rescue Exception => e
      render :edit
    end
  end

  def destroy
    begin
      @laboratory.inactive!
      redirect_to laboratries_path
    rescue Exception => e
      render :index
    end
  end

  def toggle_status
    @laboratory.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def service_params
      params.require(:service).permit(:laboratory_id, :user_id, :subject, :pick_up_date, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
    end

    def sample_preliminaries
      [:id, :name, :quantity, :description]
    end

    def sample_processeds
      [:id, :category, :description, :pucp_code, :client_code, sample_features_attributes: sample_features]
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

end
