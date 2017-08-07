class CheckServicesController < ApplicationController

before_action :set_service, only: [:show]

  def index
    @services = Service.own_per_user(current_user)
  end  

  def search
    user_services = Service.own_per_user current_user
    start_date = params[:start_date].to_date.strftime("%m/%d/%Y")
    end_date = params[:end_date].to_date.strftime("%m/%d/%Y")

    @services = user_services.where "pick_up_date >= :start_date AND pick_up_date <= :end_date", {start_date: start_date, end_date: end_date}
  end

  private 
    def set_service
      @service = Service.find(params[:id])
    end
end
