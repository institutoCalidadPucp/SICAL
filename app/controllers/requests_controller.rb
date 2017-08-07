class RequestsController < ApplicationController

   before_action :set_request, only: [:show, :edit, :update, :toggle_status]
   before_action :set_laboratories, only: [:new, :create, :update, :edit]

  def index
     @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new request_params
    if @request.save
      current_user.register_audit "Creacion de solicitud de orden de trabajo", "added", @request.id, @request.tittle, @request.class.to_s
      redirect_to requests_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @request.assign_attributes laboratory_params
    if @request.save
      current_user.register_audit "Actualizacion de informacion de solicitud de orden de trabajo", "updated", @request.id, @request.tittle, @request.class.to_s
      redirect_to request_path, notice: 'Solicitud de servicio fue editada exitosamente'
    else 
      render :edit
    end
  end
  
  def toggle_status
    @request.change_status
    current_user.register_audit  @request.tooltip_status +  " Solicitud de orden de trabajo", "updated", @request.id, @request.tittle, @request.class.to_s
    respond_to do |format|
      format.js
    end
  end
  
  private 
    def request_params
      params.require(:request).permit(:laboratory_id, :topic, :status, :code, :shipping_date, request_service_descriptions_attributes: [:sample_name, :amount, :description]  )
    end

    def set_request
      @request = Request.find params[:id]
    end

    def set_laboratories
      @laboratories = Laboratory.all
    end
end
