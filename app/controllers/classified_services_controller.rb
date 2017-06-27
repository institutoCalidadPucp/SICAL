class ClassifiedServicesController < ApplicationController

  before_action :set_service, only: [:edit, :update, :destroy, :show]
  before_action :laboratories, only: [:edit, :new, :show]
  before_action :sample_categories, only: [:new, :create, :edit, :update, :show]	

	def index
		@services_unclassified = Service.inital_funded_accepted current_user	
    @services_classified_to_check = Service.classified_to_check current_user  
	end

	def edit
     @employees = User.own_per_user(current_user).employee		
	end

	def update   
    @service.assign_attributes service_params
    # Mejorar esto
    if params[:valid_classified] == 1
      @service.valid_classified = true
    else
      @service.nr_revision = @service.nr_revision + 1
    end
    if @service.valid?
      @service.set_work_flow(current_user)
      redirect_to classified_services_path
    else
      render :edit
    end		
	end

	private

    def service_params
      params.require(:service).permit(:valid_classified,:laboratory_id, :user_id, :employee_id, :subject, :pick_up_date, sample_preliminaries_attributes: sample_preliminaries, sample_processeds_attributes: sample_processeds)
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

    def laboratories
      @laboratories = Laboratory.all
    end

end
