class CheckServicesController < ApplicationController
  def index
    @services = Service.own_per_user(current_user)
  end
end
