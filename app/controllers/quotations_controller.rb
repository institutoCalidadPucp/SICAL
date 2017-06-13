class QuotationsController < ApplicationController
	
  before_action :set_service, only: [:edit, :update, :destroy, :show]

  def index
    @quotations = Service.prepared
    @funded = Service.own_per_user(current_user).funded
    @unfunded = Service.own_per_user(current_user).prepared
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
    @service.assign_attributes service_params
    if @service.valid
      @service.funded!
      redirect_to  quotations_path
    else
      render :edit
    end    
  end

  def toggle_status
    @laboratory.change_status
    respond_to do |format|
      format.js
    end
  end  

  def set_service
    @service = Service.find params[:id]
  end
end
