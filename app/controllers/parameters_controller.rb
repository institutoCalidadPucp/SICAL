class ParametersController < ApplicationController

  before_action :set_parameter, only: [:edit, :update, :show]

  def index
    @parameters = Parameter.all
  end

  def edit
  end

  def update 
    @parameter.assign_attributes parameter_params
    if @parameter.save
      redirect_to parameters_path
    else
      render :edit
    end
  end



  private 
    def parameter_params
      params.require(:parameter).permit(:max_attempts, :max_priority)
    end

    def set_parameter
      @parameter = Parameter.find params[:id]
    end

end
