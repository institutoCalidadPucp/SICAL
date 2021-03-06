class QuotationsController < ApplicationController
	
  before_action :set_service, only: [:new, :edit, :update, :destroy, :show]
  before_action :set_sample_methods, only: [:edit, :update]
  before_action :set_laboratories, only: [:edit, :new]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]
  before_action :employees , only: [:edit]
  before_action :set_users_belongs_to_laboratory, only: [:edit, :new]

  def index

    # EMPLOYEE - Sees all the new requests (Concurrency kek)
    @initial_unfunded = Service.quotations_without_funded current_user
    # USER - Accepts the fist quotation 
    @initial_funded = Service.quotations_with_initial_funded current_user
    # EMPLOYEE - Make the adjustments after the custody chain
    @services_to_adjusts = Service.passed_classification current_user
    # USER - Accept the final adjustment of the Service
    @adjusted_services = Service.adjusted_by_lab_leader current_user
    # EMPLOYEE - Contract Generation. Assign work orders
    @contract_bound_services = Service.contract_bound current_user    
    # In WorkOrder cards
    @services_with_engagements = Service.services_with_engagements current_user
  end

  def new
  end

  def show
  end

  def create
  end

  def edit   
  end

  def get_sample_methods
    respond_to do |format|
      format.json {
        render json: {sample_methods: SampleCategory.find(params[:id]).sample_methods}
      }
    end
  end

  def get_sample_method
    respond_to do |format|
      format.json {
        render json: {sample_method: SampleMethod.find(params[:id])}
      }
    end
  end

  def update
    begin
    if @service.accepted_contract?
      @service.asssign_workers_work params, current_user
      @service.set_work_flow current_user
      current_user.register_audit "Asignacion de trabajador a orden de trabajo", "updated", @service.id, "Trabajo", @service.class.to_s
      redirect_to  quotations_path
    else
      @service.assign_attributes quotation_params
      if @service.save
        current_user.register_audit "Validacion del estado de la orden de trabajo", "updated", @service.id, "Trabajo", @service.class.to_s
        @service.set_work_flow(current_user)
        redirect_to  quotations_path
      else
        render :edit
      end 
    end       
    rescue Exception => e
      p e.to_s
      redirect_to quotations_path      
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
      params.require(:service).permit(:laboratory_id, :valid_initial_funded, :valid_classified, :subject, :pick_up_date, :engagement, :total, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
    end

    def sample_processeds
      [:id, :category_id, :description, :pucp_code, :client_code, :amount, :unit_cost, :subtotal_cost, :discount,  :sample_method_id, :user_id, sample_features_attributes: sample_features]
    end

    def sample_features
      [:id, :value, :description]
    end

    def sample_preliminaries
      [:id, :name, :quantity, :description, :sample_method_id, :sample_category_id, :unit_cost]
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

    def employees
      @employees = User.own_per_user(current_user).employee
    end

    def set_users_belongs_to_laboratory
      @users = User.own_per_user(current_user)
    end
end
