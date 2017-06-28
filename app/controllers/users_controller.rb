class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update]
	
	def edit
	end

	def update
	end

	private
		def set_user
			@user = User.find params[:id]
		end
end
