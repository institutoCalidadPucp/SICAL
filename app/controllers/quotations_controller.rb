class QuotationsController < ApplicationController
	
  before_action :set_service, only: [:new, :edit, :update, :destroy, :show]
  before_action :set_sample_methods, only: [:edit, :update]
  before_action :set_laboratories, only: [:edit, :new]


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

  def set_sample_methods
    @sample_methods = SampleMethod.all
  end

  def set_laboratories
    @laboratories = Laboratory.all
  end
end
