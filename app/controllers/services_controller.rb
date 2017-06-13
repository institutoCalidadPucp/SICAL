class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def create

  end

  def new 
    @service = Service.new
    @laboratories = Laboratory.all
  end

  private
    def service_params
      params.require(:service).permit(:subject, :pick_up_date, sample_preliminaries_attributes: [:name, :quantity, :description])
    end

end
