class CheckServicesController < ApplicationController

before_action :set_service, only: [:show]

  def index
    @services = Service.own_per_user(current_user)
  end  

  def search
    user_services = Service.own_per_user current_user    
  	@services = user_services.where "created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date].to_date, end_date: params[:end_date].to_date}   
  end

  private 
    def set_service
      @service = Service.find(params[:id])
    end
end
