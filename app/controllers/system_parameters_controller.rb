class SystemParametersController < ApplicationController

	before_action :system_parameters, only: [:index, :edit, :update, :show]
	before_action :set_system_parameter, only: [:edit, :update, :show]

	def index
	end

	def show
	end

	def edit
	end

	def update
    @system_parameter.assign_attributes system_parameter_params
    if @system_parameter.save
      redirect_to system_parameters_path
    else 
      render :edit
    end		
	end

	private
		def system_parameters
			@system_parameters = SystemParameter.all
		end

		def set_system_parameter
			@system_parameter = SystemParameter.find params[:id]
		end

		def system_parameter_params
      params.require(:system_parameter).permit(:description, :min, :max)
		end
end
