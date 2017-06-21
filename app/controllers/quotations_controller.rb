class QuotationsController < ApplicationController
	
  before_action :set_service, only: [:new, :edit, :update, :destroy, :show]
  before_action :set_sample_methods, only: [:edit, :update]
  before_action :set_laboratories, only: [:edit, :new]
  before_action :set_users_belongs_to_laboratory, only: [:edit, :new]

  def index
    @quotations = Service.prepared
    @funded = Service.own_per_user(current_user).funded
    @unfunded = Service.own_per_user(current_user).prepared
    @accepted = Service.own_per_user(current_user).accepted
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
    @service.assign_attributes quotation_params
    if @service.save
      @service.set_work_flow(current_user)
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

  private 

    def quotation_params
      params.require(:service).permit(:laboratory_id, :subject, :pick_up_date, :engagement, :engagement_observation, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
    end

    def sample_processeds
      [:id, :category, :description, :pucp_code, :client_code, :amount, :unit_cost, :subtotal_cost, :discount,  :sample_method_id, :user_id, sample_features_attributes: sample_features]
    end

    def sample_features
      [:id, :value, :description]
    end

    def sample_preliminaries
      [:id, :name, :quantity, :description]
    end

    def set_service
      @service = Service.find params[:id]
    end

    def set_sample_methods
      @sample_methods = SampleMethod.all
    end

    def set_laboratories
      @laboratories = Laboratory.active
    end

    def set_users_belongs_to_laboratory
      @users = User.own_per_user(current_user)
    end
end
