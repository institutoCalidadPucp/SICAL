class LaboratoriesController < ApplicationController

  before_action :set_laboratory, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def show
  end

  def create
    @laboratory = Laboratory.new laboratory_params
    if @laboratory.save
      current_user.register_audit "Creacion de laboratorio", "added", @laboratory.id, @laboratory.name, @laboratory.class.to_s
      redirect_to laboratories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @laboratory.assign_attributes laboratory_params
    if @laboratory.save
      current_user.register_audit "Actualizacion de informacion de laboratorio", "updated", @laboratory.id, @laboratory.name, @laboratory.class.to_s
      redirect_to laboratories_path
    else
      render :edit
    end
  end

  def toggle_status
    @laboratory.change_status
    current_user.register_audit  @laboratory.tooltip_status +  " laboratorio", "updated", @laboratory.id, @laboratory.name, @laboratory.class.to_s
    respond_to do |format|
      format.js
    end
  end

  private
    def laboratory_params
      params.require(:laboratory).permit(:name, :phone, :email, :address, :description, :header_image,:internal_report,:accredited_report,:normal_report)
    end

    def set_laboratory
      @laboratory = Laboratory.find params[:id]
    end

end