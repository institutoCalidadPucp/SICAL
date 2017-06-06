class RequestsController < ApplicationController
   before_action :set_role, only: [:edit, :update, :destroy, :toggle_status]
  
  def index
     @requests = Request.all
  end

  def new
    @requests = Request.new
  end

  def create
     @requests = Request.new request_params
    if (@request.set_tab_reference).save
      redirect_to requests_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    begin
      @request.destroy
      @request = Request.new request_params
      if (@request.set_tab_reference).save
        redirect_to request_path, notice: 'Solicitud de servicio fue editada exitosamente'
      else 
        render :edit
      end
    rescue
      false
    end
  end

  def destroy
    @request.inactive!
    redirect_to requests_path
  end
  
   def toggle_status
    @request.change_status
    respond_to do |format|
      format.js
    end
  end
  private 
    def request_params
      params.require(:request).permit(:laboratory, :topic )
    end

    def set_request
      @request = Request.find params[:id]
    end
end
