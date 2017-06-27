class CheckServicesController < ApplicationController
before_action :set_service, only: [:show]
  def index
    @services = Service.own_per_user(current_user)
  end  

  private 
  def set_service
    @service = Service.find(params[:id])
  end
end
