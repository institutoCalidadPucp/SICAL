class QuotationsController < ApplicationController
	
  before_action :set_service, only: [:new, :edit, :update, :destroy, :show]
  before_action :set_sample_methods, only: [:edit, :update]
  before_action :set_laboratories, only: [:edit, :new]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]
  before_action :set_users_belongs_to_laboratory, only: [:edit, :new]

  def index
    @funded = Service.funded
    @unfunded = Service.own_per_user(current_user).classified.internal_accepted
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
    p '******************************* 1'
    if @service.save
      p '******************************* 1'
      @service.set_work_flow(current_user)
      p '******************************* 1'
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
      params.require(:service).permit(:laboratory_id, :valid_classified, :subject, :pick_up_date, :engagement, :engagement_observation, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
    end

    def sample_processeds
      [:id, :category_id, :description, :pucp_code, :client_code, :amount, :unit_cost, :subtotal_cost, :discount,  :sample_method_id, :user_id, sample_features_attributes: sample_features]
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
      @laboratories = Laboratory.all
    end

    def sample_categories
      @sample_categories = SampleCategory.own_per_user current_user
    end    

    def set_users_belongs_to_laboratory
      @users = User.own_per_user(current_user)
    end
end
