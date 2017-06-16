class LaboratoriesController < ApplicationController

  before_action :set_laboratory, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
    begin
      @laboratories = Laboratory.all
    rescue Exception => e
      true
    end
  end

  def new
    begin
      @laboratory = Laboratory.new
    rescue Exception => e
      render :index
    end
  end

  def show
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def create
    begin
      @laboratory = Laboratory.new laboratory_params
      if @laboratory.save
        redirect_to laboratories_path
      else
        render :new
      end
    rescue Exception => e
      render :new
    end
  end

  def edit
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def update
    begin
      @laboratory.assign_attributes laboratory_params
      if @laboratory.save
        redirect_to laboratories_path
      else
        render :edit
      end
    rescue Exception => e
      render :edit
    end
  end

  def toggle_status
    @laboratory.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def laboratory_params
      params.require(:laboratory).permit(:name, :phone, :email, :address, :description)
    end

    def set_laboratory
      @laboratory = Laboratory.find params[:id]
    end

end