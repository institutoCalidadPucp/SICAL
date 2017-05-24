class RolesController < ApplicationController

	layout 'admin'

	 before_action :set_role, only: [:edit, :update]

	def index
		@roles=Role.all
	end

	def new
		@role=Role.new
	end

	def create
		@role=Role.new role_params
		if @role.save
			redirect_to roles_path
		else 
			render :new
		end
 	end

 	def edit

 	end

 	def update
 		@role.assign_attributes role_params
 		if @role.save
			redirect_to roles_path, notice: 'Rol fue editado exitosamente'
		else 
			render :edit
		end
	end

	private 
	def role_params
		params.require(:role).permit(:id,:name)
	end

	def set_role
		@role=Role.find params[:id]
	end
end
