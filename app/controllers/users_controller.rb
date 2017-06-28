class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    @user.assign_attr user_params, params
    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :last_name, :phone, :address, :gender, :date_of_birth, :ruc, :contact_person)
    end

    def set_user
      @user = User.find params[:id]
    end

end
